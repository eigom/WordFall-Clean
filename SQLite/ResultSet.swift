struct ResultSet {
    enum Value {
        case null
        case integer(Int)
        case string(String)
        case unsupported
    }

    typealias Row = [Value]

    let columnNames: [String]
    let rows: [Row]

    func appending(_ row: Row) -> ResultSet {
        return ResultSet(columnNames: columnNames, rows: rows + [row])
    }

    static let empty = ResultSet(columnNames: [], rows: [])
}
