struct QueryParameter {
    enum ParameterValue: Equatable {
        case integer(Int64)

        var stringValue: String {
            switch self {
            case .integer(let value):
                return String(value)
            }
        }
    }

    let name: String
    let value: ParameterValue

    var parameterString: String { ":\(name)" }
    var valueString: String { value.stringValue }

    static func integer(_ value: Int64, name: String) -> QueryParameter {
        return QueryParameter(name: name, value: .integer(value))
    }
}
