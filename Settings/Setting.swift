//
//  Copyright 2023 Eigo Madaloja
//

public protocol Setting: AnyObject {
    associatedtype ValueType

    var value: ValueType { get set }

    func addObserver(_ observer: AnyObject, onUpdated: @escaping (ValueType) -> Void)
    func removeObserver(_ observer: AnyObject)
}
