import SQLite3

public final class Connection {
    let handle: OpaquePointer

    public init(databasePath: String) throws {
        var handle: OpaquePointer?

        try SQLiteExec(expect: SQLITE_OK, databaseHandle: handle) {
            sqlite3_open(databasePath, &handle)
        } orThrow: { _, errorMessage in
            sqlite3_close(handle)
            return SQLiteError.unableToOpen(databasePath: databasePath, errorMessage: errorMessage)
        }

        guard let handle = handle else { throw SQLiteError.unexpectedNilHandle }

        self.handle = handle
    }

    deinit {
        try? close()
    }

    func close() throws {
        try SQLiteExec(expect: SQLITE_OK, databaseHandle: handle) {
            sqlite3_close(handle)
        } orThrow: { _, errorMessage in
            SQLiteError.unableToClose(errorMessage: errorMessage)
        }
    }
}
