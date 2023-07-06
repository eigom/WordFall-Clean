import StoreKit

public class StoreKitProductService: ProductService {
    public func loadProduct(
        withID productID: String,
        completion: @escaping (Result<StoreKit.Product, ProductLoadingError>
    ) -> Void) {
        Task {
            do {
                let products = try await Product.products(for: [productID])
                let product = products.first(where: { $0.id == productID })

                guard let product else {
                    completion(.failure(.productNotFound))
                    return
                }

                completion(.success(product))
            } catch {
                completion(.failure(.error(error)))
            }
        }
    }
}
