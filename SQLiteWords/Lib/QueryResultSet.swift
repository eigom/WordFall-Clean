struct QueryResultSet {
    enum ResultValue {
        case string(String)
    }

    typealias Row = [ResultValue]
    
    let columnNames: [String]
    var rows = [Row]()

    mutating func append(_ row: Row) {
        rows.append(row)
    }

    static let empty = QueryResultSet(columnNames: [])
}
