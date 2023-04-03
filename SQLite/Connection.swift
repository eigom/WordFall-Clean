import SQLite3

public class Connection {
    public enum Error: Swift.Error {
        case unableToOpen(dbPath: String, errorCode: Int32)
        case unableToClose(errorCode: Int32)
    }

    let handle: OpaquePointer?

    public init(dbPath: String) throws {
        var handle: OpaquePointer?
        let resultCode = sqlite3_open(dbPath, &handle)

        guard resultCode == SQLITE_OK else {
            sqlite3_close(handle)
            throw Error.unableToOpen(dbPath: dbPath, errorCode: resultCode)
        }

        self.handle = handle
    }

    deinit {
        try? close()
    }

    func close() throws {
        try SQLiteExec(expect: SQLITE_OK) {
            sqlite3_close(handle)
        } orThrow: { errorCode in
            Error.unableToClose(errorCode: errorCode)
        }
    }
}
