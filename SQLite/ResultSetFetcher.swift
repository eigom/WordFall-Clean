import SQLite3

final class ResultSetFetcher {
    public enum Error: Swift.Error {
        case failedToGetColumnName
        case failedToPrepareQuery(String, errorCode: Int32)
        case failedToEvaluateQuery(String, errorCode: Int32)
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

        let columnNames = try columnNames(in: statement)
        let resultSet = ResultSet(columnNames: columnNames)

        while true {
            let stepResult = sqlite3_step(statement)
            guard stepResult != SQLITE_DONE else { return resultSet }
            guard stepResult == SQLITE_ROW else { throw Error.failedToEvaluateQuery(query, errorCode: stepResult) }
        }
    }

    private func columnNames(in statement: OpaquePointer?) throws  -> [String] {
        let columnCount = sqlite3_column_count(statement)

        return try (0 ..< columnCount).reduce([String]()) { columnNames, index in
            guard let name = sqlite3_column_name(statement, 0) else { throw Error.failedToGetColumnName }
            return columnNames + [String(cString: name)]
        }
    }

    private func row(from statement: OpaquePointer?) -> ResultSet.Row {

    }
}
