public protocol PurchasingService {
    associatedtype Product
    associatedtype PurchaseTransaction

    func loadProduct(withID: String, completion: () -> Result<Product, Error>)
    func purchaseProduct(_ product: Product, completion: () -> Result<PurchaseTransaction, Error>)
    func restorePurchases()
}
