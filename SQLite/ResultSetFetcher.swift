import SQLite3

final class ResultSetFetcher {
    public enum Error: Swift.Error {
        case failedToPrepareQuery(String, errorCode: Int32)
        case invalidStatementHandle
    }

    private let databaseHandle: OpaquePointer

    init(databaseHandle: OpaquePointer) {
        self.databaseHandle = databaseHandle
    }

    func fetch(query: String) throws -> ResultSet {
        var statement: OpaquePointer?

        try SQLiteExec(expect: SQLITE_OK) {
            sqlite3_prepare_v2(databaseHandle, query, -1, &statement, nil)
        } orThrow: { errorCode in
            Error.failedToPrepareQuery(query, errorCode: errorCode)
        }

        defer { sqlite3_finalize(statement) }

        guard let statement = statement else { throw Error.invalidStatementHandle }

        let resultBuilder = ResultSetBuilder(statement: statement)
        
        return try resultBuilder.build()
    }
}
