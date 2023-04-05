final class QueryBuilder {
    private let query: String
    private let parameters: [QueryParameter]

    init(query: String, parameters: [QueryParameter]) {
        self.query = query
        self.parameters = parameters
    }

    func build() -> String {
        parameters.reduce(query) { partialQuery, parameter in
            partialQuery.replacing(parameter.parameterString, with: parameter.valueString)
        }
    }
}
