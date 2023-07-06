import StoreKit

public class StoreKitPurchasingService: PurchasingService {
    public func purchaseProduct(
        _ product: StoreKit.Product,
        completion: @escaping (Result<StoreKit.Transaction, ProductPurchasingError>
    ) -> Void) {

    }
}
