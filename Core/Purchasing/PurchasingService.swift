//
//  Copyright 2023 Eigo Madaloja
//

public protocol PurchasingService {
    associatedtype Product
    associatedtype PurchaseTransaction

    func purchaseProduct(
        _ product: Product,
        completion: @escaping (Result<PurchaseTransaction, ProductPurchasingError>
    ) -> Void)
}

public enum ProductPurchasingError: Error {
    case unknown
    case userCancelled
    case pendingApproval
    case transactionUnverified
    case error(Error)
}
