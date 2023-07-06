public protocol PurchasingService {
    associatedtype Product
    associatedtype PurchaseTransaction

    func purchaseProduct(
        _ product: Product,
        completion: @escaping (Result<PurchaseTransaction, ProductPurchasingError>
    ) -> Void)

    func restorePurchases()
}

public enum ProductPurchasingError: Error {
    case userCancelled
    case pendingApproval
    case error(Error)
}
