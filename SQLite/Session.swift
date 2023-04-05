public final class Session {
    let connection: Connection

    public init(connection: Connection) {
        self.connection = connection
    }

    func fetch<Result: Decodable>(query: String, parameters: [QueryParameter]) throws -> Result {
        let query = QueryBuilder(query: query, parameters: parameters).build()
        let resultSet = try ResultSetFetcher(query: query, databaseHandle: connection.handle).fetch()
        let encodedResultSet = try ResultSetJSONEncoder(resultSet: resultSet).encode()
        let result: Result = try ResultJSONDecoder(jsonString: encodedResultSet).decode()

        return result
    }
}
