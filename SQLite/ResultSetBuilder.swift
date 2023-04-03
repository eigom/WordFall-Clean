import SQLite3

final class ResultSetBuilder {
    public enum Error: Swift.Error {
        case failedToGetColumnName
        case failedToEvaluateQuery(errorCode: Int32)
    }

    private let statement: OpaquePointer

    init(statement: OpaquePointer) {
        self.statement = statement
    }

    func build() throws -> ResultSet {
        let columnCount = sqlite3_column_count(statement)
        let columnNames = try columnNames(in: statement, columnCount: columnCount)
        var resultSet = ResultSet(columnNames: columnNames, rows: [])

        while true {
            let stepResult = sqlite3_step(statement)
            guard stepResult != SQLITE_DONE else { return resultSet }
            guard stepResult == SQLITE_ROW else { throw Error.failedToEvaluateQuery(errorCode: stepResult) }

            let row = row(from: statement, columnCount: columnCount)
            resultSet = resultSet.appending(row)
        }

        return resultSet
    }

    private func columnNames(in statement: OpaquePointer, columnCount: Int32) throws  -> [String] {
        return try (0 ..< columnCount).reduce([String]()) { columnNames, index in
            guard let name = sqlite3_column_name(statement, 0) else { throw Error.failedToGetColumnName }
            return columnNames + [String(cString: name)]
        }
    }

    private func row(from statement: OpaquePointer, columnCount: Int32) -> ResultSet.Row {
        sqlite3_column_
    }
}
