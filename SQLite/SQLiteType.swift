import SQLite3

enum SQLiteType {
    case integer
    case text
    case null
    case unsupported

    init(_ type: Int32) {
        switch type {
        case SQLITE_INTEGER:
            self = .integer
        case SQLITE_TEXT:
            self = .text
        case SQLITE_NULL:
            self = .null
        default:
            self = .unsupported
        }
    }
}
