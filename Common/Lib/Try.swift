//
//  Copyright 2023 Eigo Madaloja
//

public enum Try<T> {
    case success(T)
    case failure(Error)

    public var get: T {
        get throws {
            switch self {
            case .success(let value):
                return value
            case .failure(let error):
                throw error
            }
        }
    }

    public init(_ work: () throws -> T) {
        do {
            self = .success(try work())
        } catch {
            self = .failure(error)
        }
    }

    public func map<U>(_ mapping: (T) -> U) -> Try<U> {
        switch self {
        case .success(let value):
            return .success(mapping(value))
        case .failure(let error):
            return .failure(error)
        }
    }
}
