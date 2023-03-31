struct QueryParameter {
    enum ParameterType: Equatable {
        case integer(Int64)
    }

    let name: String
    let type: ParameterType

    static func integer(_ value: Int64, name: String) -> QueryParameter {
        return QueryParameter(name: name, type: .integer(value))
    }
}

extension QueryParameter: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
