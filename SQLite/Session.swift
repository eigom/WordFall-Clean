public final class Session {
    let connection: Connection

    public init(connection: Connection) {
        self.connection = connection
    }

    public func fetch<Result: Decodable>(
        query: String,
        parameters: [QueryParameter],
        resultTypes: [SQLiteType]
    ) throws -> Result {
        let query = QueryBuilder(query: query, parameters: parameters).build()
        let resultSet = try ResultSetFetcher(
            query: query,
            resultTypes: resultTypes,
            databaseHandle: connection.handle
        ).fetch()
        let encodedResultSet = try ResultSetJSONEncoder(resultSet: resultSet).encode()
        let result: Result = try ResultJSONDecoder(jsonString: encodedResultSet).decode()

        return result
    }
}
