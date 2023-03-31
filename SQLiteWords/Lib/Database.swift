import SQLite3

class Database {
    enum Error: Swift.Error {
        case unableToOpen(dbPath: String, errorCode: Int32)
        case unableToClose(errorCode: Int32)
    }

    private let connection: OpaquePointer

    init(dbPath: String) throws {
        var connection: OpaquePointer?
        let resultCode = sqlite3_open(dbPath, &connection)

        guard
            resultCode == SQLITE_OK,
            let connection = connection
        else {
            throw Error.unableToOpen(dbPath: dbPath, errorCode: resultCode)
        }

        self.connection = connection
    }

    deinit {
        try? close()
    }

    func close() throws {
        let resultCode = sqlite3_close(connection)

        guard resultCode == SQLITE_OK else {
            throw Error.unableToClose(errorCode: resultCode)
        }
    }
}
