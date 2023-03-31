enum ResultValue {
    case string(String)
}

typealias Row = [ResultValue]

struct QueryResultSet {
    let columnNames: [String]
    var rows = [Row]()

    mutating func append(_ row: Row) {
        rows.append(row)
    }

    static let empty = QueryResultSet(columnNames: [])
}
