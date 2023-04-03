struct ResultSet {
    enum ResultValue {
        case string(String)
    }

    typealias Row = [ResultValue]
    
    let columnNames: [String]
    let rows: [Row]

    func appending(_ row: Row) -> ResultSet {
        return ResultSet(columnNames: columnNames, rows: rows + [row])
    }

    static let empty = ResultSet(columnNames: [], rows: [])
}
