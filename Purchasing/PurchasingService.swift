public protocol PurchasingService {
    associatedtype Product
    associatedtype PurchaseTransaction

    func loadProduct(withID productID: String, completion: @escaping (Result<Product, ProductLoadingError>) -> Void)
    func purchaseProduct(_ product: Product, completion: @escaping (Result<PurchaseTransaction, ProductPurchasingError>) -> Void)
    func restorePurchases()
}

public enum ProductLoadingError: Error {
    case productNotFound
    case error(Error)
}

public enum ProductPurchasingError: Error {
    case userCancelled
    case pendingApproval
    case error(Error)
}
