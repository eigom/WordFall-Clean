struct ResultSetJSONEncoder {
    static func encode(_ resultSet: ResultSet) throws -> String {
        let encodedRows = try resultSet.rows.reduce([String]()) { partialResult, row in
            partialResult + [try encode(row, in: resultSet)]
        }

        return "[" + encodedRows.joined(separator: ", ") + "]"
    }

    private static func encode(_ row: ResultSet.Row, in resultSet: ResultSet) throws -> String {
        let encodedValues = try row.enumerated().reduce([String]()) { partialResult, value in
            let name = "\"" + resultSet.columnNames[value.offset] + "\""
            let value = try encode(value.element)
            return partialResult + ["\(name): \(value)"]
        }

        return "{" + encodedValues.joined(separator: ", ") + "}"
    }

    private static func encode(_ value: ResultSet.Value) throws -> String {
        switch value {
        case .null:
            return "null"
        case .integer(let value):
            return String(value)
        case .string(let value):
            let escapedValue = value.replacing("\"", with: "\\\"")
            return "\"" + escapedValue + "\""
        case .unsupported:
            throw SQLiteError.unsupportedValueInResultSet
        }
    }

    private init() {}
}
