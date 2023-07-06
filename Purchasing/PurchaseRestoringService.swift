public protocol PurchaseRestoringService {
    func restorePurchases(completion: @escaping (Result<Void, Error>) -> Void)
}
