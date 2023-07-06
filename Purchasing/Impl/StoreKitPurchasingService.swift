import StoreKit

public class StoreKitPurchasingService: PurchasingService {
    public typealias Product = StoreKit.Product
    public typealias PurchaseTransaction = StoreKit.Transaction

    public func loadProduct(withID productID: String, completion: @escaping (Result<Product, ProductLoadingError>) -> Void) {
        Task {
            do {
                let products = try await Product.products(for: [productID])

                guard let product = products.first(where: { $0.id == productID }) else {
                    completion(.failure(.productNotFound))
                    return
                }

                completion(.success(product))
            } catch {
                completion(.failure(.error(error)))
            }
        }
    }

    public func purchaseProduct(_ product: Product, completion: @escaping (Result<PurchaseTransaction, ProductPurchasingError>) -> Void) {

    }

    public func restorePurchases() {

    }
}
