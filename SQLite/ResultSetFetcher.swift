import SQLite3

final class ResultSetFetcher {
    private let query: String
    private let resultTypes: [SQLiteType]
    private let databaseHandle: OpaquePointer

    init(query: String, resultTypes: [SQLiteType], databaseHandle: OpaquePointer) {
        self.query = query
        self.resultTypes = resultTypes
        self.databaseHandle = databaseHandle
    }

    func fetch() throws -> ResultSet {
        var statement: OpaquePointer?

        try SQLiteExec(expect: SQLITE_OK, databaseHandle: databaseHandle) {
            sqlite3_prepare_v2(databaseHandle, query, -1, &statement, nil)
        } orThrow: { _, errorMessage in
            SQLiteError.failedToPrepareQuery(query, errorMessage: errorMessage)
        }

        defer { sqlite3_finalize(statement) }

        guard let statement = statement else { throw SQLiteError.invalidStatementHandle }

        let resultBuilder = ResultSetBuilder(
            statement: statement,
            resultTypes: resultTypes,
            databaseHandle: databaseHandle
        )

        return try resultBuilder.build()
    }
}
