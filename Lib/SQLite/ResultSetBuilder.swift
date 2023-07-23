import SQLite3

//
//  Copyright 2023 Eigo Madaloja
//

struct ResultSetBuilder {
    static func build(
        statement: OpaquePointer,
        resultTypes: [SQLiteType],
        databaseHandle: OpaquePointer
    ) throws -> ResultSet {
        let columnCount = sqlite3_column_count(statement)
        let columnNames = try columnNames(in: statement, columnCount: columnCount)

        var resultSet = ResultSet(columnNames: columnNames, rows: [])

        while true {
            let stepResult = sqlite3_step(statement)
            guard stepResult != SQLITE_DONE else { return resultSet }

            try SQLiteExec(expect: SQLITE_ROW, databaseHandle: databaseHandle) {
                stepResult
            } orThrow: { _, errorMessage in
                SQLiteError.failedToEvaluateQuery(errorMessage: errorMessage)
            }

            let row = row(from: statement, columnTypes: resultTypes)
            resultSet = resultSet.appending(row)
        }

        return resultSet
    }

    private static func columnNames(in statement: OpaquePointer, columnCount: Int32) throws -> [String] {
        return try (0 ..< columnCount).reduce([String]()) { columnNames, index in
            guard let name = sqlite3_column_name(statement, index) else { throw SQLiteError.failedToGetColumnName }
            return columnNames + [String(cString: name)]
        }
    }

    private static func row(from statement: OpaquePointer, columnTypes: [SQLiteType]) -> ResultSet.Row {
        return columnTypes.enumerated().reduce([ResultSet.Value]()) { partialRow, type in
            let value = value(from: statement, at: Int32(type.offset), type: type.element)
            return partialRow + [value]
        }
    }

    private static func value(from statement: OpaquePointer, at index: Int32, type: SQLiteType) -> ResultSet.Value {
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
