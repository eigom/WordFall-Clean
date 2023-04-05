import SQLite3

final class ResultSetFetcher {
    private let databaseHandle: OpaquePointer

    init(databaseHandle: OpaquePointer) {
        self.databaseHandle = databaseHandle
    }

    func fetch(query: String) throws -> ResultSet {
        var statement: OpaquePointer?

        try SQLiteExec(expect: SQLITE_OK, databaseHandle: databaseHandle) {
            sqlite3_prepare_v2(databaseHandle, query, -1, &statement, nil)
        } orThrow: { errorCode, errorMessage in
            SQLiteError.failedToPrepareQuery(query, errorMessage: errorMessage)
        }

        defer { sqlite3_finalize(statement) }

        guard let statement = statement else { throw SQLiteError.invalidStatementHandle }

        let resultBuilder = ResultSetBuilder(statement: statement, databaseHandle: databaseHandle)
        
        return try resultBuilder.build()
    }
}
