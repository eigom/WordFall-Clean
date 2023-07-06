import StoreKit

public struct StoreKitPurchasingService: PurchasingService {
    public func purchaseProduct(
        _ product: StoreKit.Product,
        completion: @escaping (Result<StoreKit.Transaction, ProductPurchasingError>
    ) -> Void) {
        Task {
            do {
                let purchaseResult = try await product.purchase()

                switch purchaseResult {
                case .success(let verificationResult):
                    switch verificationResult {
                    case .unverified:
                        completion(.failure(.transactionUnverified))
                    case .verified(let verifiedTransaction):
                        await verifiedTransaction.finish()
                        completion(.success(verifiedTransaction))
                    }
                case .userCancelled:
                    completion(.failure(.userCancelled))
                case .pending:
                    completion(.failure(.pendingApproval))
                @unknown default:
                    completion(.failure(.unknown))
                }
            } catch {
                completion(.failure(.error(error)))
            }
        }
    }
}
