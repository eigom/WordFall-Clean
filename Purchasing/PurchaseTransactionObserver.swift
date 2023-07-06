public protocol PurchaseTransactionObserver {
    associatedtype Transaction
    typealias Update = ([Transaction]) -> Void

    func addObserver(_ observer: AnyObject, onUpdate: @escaping Update)
    func removeObserver(_ observer: AnyObject)

    func startObserving()
    func stopObserving()
}
