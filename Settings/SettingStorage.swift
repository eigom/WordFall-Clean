public protocol SettingStorage {
    associatedtype ValueType

    func value(for identifier: String) -> ValueType?
    func store(_ value: ValueType, for identifier: String)
}
