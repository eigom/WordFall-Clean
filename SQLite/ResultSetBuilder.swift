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
        let columnTypes = columnTypes(in: statement, columnCount: columnCount)
        let columnNames = try columnNames(in: statement, columnCount: columnCount)
        
        var resultSet = ResultSet(columnNames: columnNames, rows: [])

        while true {
            let stepResult = sqlite3_step(statement)
            guard stepResult != SQLITE_DONE else { return resultSet }
            guard stepResult == SQLITE_ROW else { throw Error.failedToEvaluateQuery(errorCode: stepResult) }

            let row = row(from: statement, columnTypes: columnTypes)
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

    private func columnTypes(in statement: OpaquePointer, columnCount: Int32) -> [SQLiteType] {
        return (0 ..< columnCount).reduce([SQLiteType]()) { columnTypes, index in
            let type = SQLiteType(sqlite3_column_type(statement, index))
            return columnTypes + [type]
        }
    }

    private func row(from statement: OpaquePointer, columnTypes: [SQLiteType]) -> ResultSet.Row {
        return columnTypes.enumerated().reduce([ResultSet.Value]()) { partialRow, type in
            let value = value(from: statement, at: Int32(type.offset), type: type.element)
            return partialRow + [value]
        }
    }

    private func value(from statement: OpaquePointer, at index: Int32, type: SQLiteType) -> ResultSet.Value {
        switch type {
        case .integer:
            let value = Int(sqlite3_column_int(statement, index))
            return .integer(value)
        case .text:
            let value = String(cString: sqlite3_column_text(statement, index))
            return .string(value)
        case .null:
            return .null
        case .unsupported:
            return .unsupported
        }
    }
}
