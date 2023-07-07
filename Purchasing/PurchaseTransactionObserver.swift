public protocol PurchaseTransactionObserver {
    associatedtype Transaction
    typealias Update = ([Transaction]) -> Void

    func addObserver(_ observer: AnyObject, onUpdated: @escaping Update)
    func removeObserver(_ observer: AnyObject)

    func startObserving()
    func stopObserving()
}
