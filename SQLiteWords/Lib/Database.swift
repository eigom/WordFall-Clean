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
        let resultCode = sqlite3_close(connection)

        guard resultCode == SQLITE_OK else {
            throw Error.unableToClose(errorCode: resultCode)
        }
    }

    func fetch<Result: Decodable & Collection>(query: String, parameters: Set<QueryParameter>) throws -> Result? {

    }

    func fetch<Result: Decodable>(query: String, parameters: Set<QueryParameter>) throws -> Result? {
        var statement: OpaquePointer?

        let prepareResult = sqlite3_prepare(connection, query, -1, &statement, nil)
        guard prepareResult == SQLITE_OK else { throw Error.failedToPrepareQuery(query, errorCode: prepareResult) }
        defer { sqlite3_finalize(statement) }

        while true {
            let stepResult = sqlite3_step(statement)
            guard stepResult != SQLITE_DONE else { break }
            guard stepResult != SQLITE_ROW else { throw Error.failedToEvaluateQuery(query, errorCode: stepResult) }
        }

        let result: Result = try JSONDecoder().decode(Result.self, from: Data())

        return result
    }


}
