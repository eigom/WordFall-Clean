import StoreKit

public class StoreKitPurchaseTransactionObserver: PurchaseTransactionObserver {
    private var observers = [() -> (AnyObject?, Update)]()
    private var updateObserverTask: Task<Void, Error>?

    public typealias Update = ([Transaction]) -> Void

    public init() {}

    deinit {
        stopObserving()
    }

    public func addObserver(_ observer: AnyObject, onUpdate: @escaping Update) {
        guard !observers.contains(where: { $0().0 === observer }) else { return }

        observers.append({ [weak observer] in (observer, onUpdate) })
    }

    public func removeObserver(_ observer: AnyObject) {
        observers.removeAll(where: { $0().0 === observer })
    }

    public func startObserving() {
        stopObserving()

        updateObserverTask = Task.detached { [weak self] in
            let verifiedTransactions = await Transaction.updates
                .collect()
                .compactMap { self?.verifiedTransaction($0) }

            for verifiedTransaction in verifiedTransactions {
                await verifiedTransaction.finish()
            }

            let latestTransactions = await Transaction.currentEntitlements
                .collect()
                .compactMap { self?.verifiedTransaction($0) }

            self?.notifyObservers(transactions: latestTransactions)
        }
    }

    public func stopObserving() {
        updateObserverTask?.cancel()
    }

    private func verifiedTransaction(_ verificationResult: VerificationResult<Transaction>) -> Transaction? {
        switch verificationResult {
        case .unverified:
            return nil
        case .verified(let transaction):
            return transaction
        }
    }

    private func notifyObservers(transactions: [Transaction]) {
        observers
            .compactMap { $0().1 }
            .forEach { onUpdate in onUpdate(transactions) }
    }
}
