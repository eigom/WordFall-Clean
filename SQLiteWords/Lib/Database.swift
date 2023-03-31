import SQLite3

class Database {
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
        try execSQLite(expect: SQLITE_OK) {
            sqlite3_close(connection)
        } orThrow: { errorCode in
            Error.unableToClose(errorCode: errorCode)
        }
    }

    func fetchSingle<Result: Decodable>(query: String, parameters: Set<QueryParameter>) throws -> Result? {

    }

    func fetchMany<Result: Decodable>(query: String, parameters: Set<QueryParameter>) throws -> [Result] {
        var statement: OpaquePointer?

        try execSQLite(expect: SQLITE_OK) {
            sqlite3_prepare(connection, query, -1, &statement, nil)
        } orThrow: { errorCode in
            Error.failedToPrepareQuery(query, errorCode: errorCode)
        }

        defer { sqlite3_finalize(statement) }

        while true {
            let stepResult = sqlite3_step(statement)
            guard stepResult != SQLITE_DONE else { break }
            guard stepResult != SQLITE_ROW else { throw Error.failedToEvaluateQuery(query, errorCode: stepResult) }
        }

        let result: Result = try JSONDecoder().decode(Result.self, from: Data())

        return result
    }

    private func fetch(query: String, parameters: Set<QueryParameter>) throws ->  {

    }

    private func execSQLite(expect successCode: Int32, statement: () -> Int32, orThrow error: (Int32) -> Error) throws {
        let resultCode = statement()
        guard resultCode == successCode else { throw error(resultCode) }
    }
}
