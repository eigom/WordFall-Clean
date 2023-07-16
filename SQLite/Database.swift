//
//  Copyright 2023 Eigo Madaloja
//

public struct Database {
    public static func fetch<Result: Decodable>(
        _ query: String,
        parameters: [QueryParameter] = [],
        resultTypes: [SQLiteType],
        using connection: Connection
    ) throws -> Result {
        let query = QueryMaker.make(query: query, parameters: parameters)

        let resultSet = try ResultSetFetcher.fetch(
            query: query,
            resultTypes: resultTypes,
            databaseHandle: connection.handle
        )

        let encodedResultSet = try ResultSetJSONEncoder.encode(resultSet)
        let result: Result = try ResultJSONDecoder.decode(jsonString: encodedResultSet)

        return result
    }

    private init() {}
}
