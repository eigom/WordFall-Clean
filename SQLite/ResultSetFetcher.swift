import SQLite3

struct ResultSetFetcher {
    static func fetch(
        query: String,
        resultTypes: [SQLiteType],
        databaseHandle: OpaquePointer
    ) throws -> ResultSet {
        var statement: OpaquePointer?

        try SQLiteExec(expect: SQLITE_OK, databaseHandle: databaseHandle) {
            sqlite3_prepare_v2(databaseHandle, query, -1, &statement, nil)
        } orThrow: { _, errorMessage in
            SQLiteError.failedToPrepareQuery(query, errorMessage: errorMessage)
        }

        defer { sqlite3_finalize(statement) }

        guard let statement = statement else { throw SQLiteError.invalidStatementHandle }

        return try ResultSetBuilder.build(
            statement: statement,
            resultTypes: resultTypes,
            databaseHandle: databaseHandle
        )
    }
}
