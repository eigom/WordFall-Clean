import StoreKit

public class StoreKitPurchaseRestoringService: PurchaseRestoringService {
    public func restorePurchases(completion: @escaping (Result<Void, Error>) -> Void) {
        Task {
            do {
                try await AppStore.sync()
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
