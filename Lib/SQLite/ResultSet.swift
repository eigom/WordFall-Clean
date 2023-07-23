//
//  Copyright 2023 Eigo Madaloja
//

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

    static let empty = ResultSet(columnNames: [], rows: [])

    func appending(_ row: Row) -> ResultSet {
        return ResultSet(columnNames: columnNames, rows: rows + [row])
    }
}
