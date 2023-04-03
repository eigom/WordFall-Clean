struct ResultSet {
    enum Value {
        case null
        case integer(Int)
        case string(String)
        case unsupported
    }

    enum Error: Swift.Error {
        case unsupportedValue
    }

    typealias Row = [Value]
    
    let columnNames: [String]
    let rows: [Row]

    func appending(_ row: Row) -> ResultSet {
        return ResultSet(columnNames: columnNames, rows: rows + [row])
    }

    static let empty = ResultSet(columnNames: [], rows: [])
}

extension ResultSet {
    var asJSONString: String {
        get throws {
            let rows = try rows.reduce([String]()) { partialResult, row in
                partialResult + [try makeJSON(for: row)]
            }
            
            return "{" + rows.joined(separator: ", ") + "}"
        }
    }

    private func makeJSON(for row: Row) throws -> String {
        let values = try row.enumerated().reduce([String]()) { partialResult, value in
            let name = "\"" + columnNames[value.offset] + "\""
            let value = try makeJSON(for: value.element)
            return partialResult + ["\(name): \(value)"]
        }

        return "[" + values.joined(separator: ", ") + "]"
    }

    private func makeJSON(for value: Value) throws -> String {
        switch value {
        case .null:
            return "null"
        case .integer(let value):
            return String(value)
        case .string(let value):
            let escapedValue = value.replacing("\"", with: "\\\"")
            return "\"" + escapedValue + "\""
        case .unsupported:
            throw Error.unsupportedValue
        }
    }
}
