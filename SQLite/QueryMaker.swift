struct QueryMaker {
    static func make(query: String, parameters: [QueryParameter]) -> String {
        parameters.reduce(query) { partialQuery, parameter in
            partialQuery.replacing(parameter.parameterString, with: parameter.valueString)
        }
    }

    private init() {}
}
