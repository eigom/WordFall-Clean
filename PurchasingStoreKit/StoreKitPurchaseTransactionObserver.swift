import Purchasing
import StoreKit
import Common

public class StoreKitPurchaseTransactionObserver: PurchaseTransactionObserver {
    private let observerNotifier = ObserverNotifier<[Transaction]>()
    private var updateObserverTask: Task<Void, Error>?

    public typealias Update = ([Transaction]) -> Void

    public init() {}

    deinit {
        stopObserving()
    }

    public func addObserver(_ observer: AnyObject, onUpdated: @escaping ([Transaction]) -> Void) {
        observerNotifier.addObserver(observer, onNotified: onUpdated)
    }

    public func removeObserver(_ observer: AnyObject) {
        observerNotifier.removeObserver(observer)
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

            self?.observerNotifier.notify(latestTransactions)
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
}
