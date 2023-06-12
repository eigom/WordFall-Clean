public enum Try<T> {
    case success(T)
    case failure(Error)

    public init(_ work: () throws -> T) {
        do {
            self = .success(try work())
        } catch {
            self = .failure(error)
        }
    }

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
}
