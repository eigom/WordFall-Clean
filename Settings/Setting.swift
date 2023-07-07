public protocol Setting {
    associatedtype ValueType

    var value: ValueType { get set }

    func addObserver(_ observer: AnyObject, onUpdated: (ValueType) -> Void)
    func removeObserver(_ observer: AnyObject)
}
