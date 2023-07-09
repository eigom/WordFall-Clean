public protocol Setting: AnyObject {
    associatedtype ValueType

    var value: ValueType { get set }

    func addObserver(_ observer: AnyObject, onUpdated: @escaping (ValueType) -> Void)
    func removeObserver(_ observer: AnyObject)
}

public protocol BooleanSetting: Setting where ValueType == Bool {}

/*public protocol BooleanSetting: AnyObject {
    var value: Bool { get set }

    func addObserver(_ observer: AnyObject, onUpdated: @escaping (Bool) -> Void)
    func removeObserver(_ observer: AnyObject)
}*/
