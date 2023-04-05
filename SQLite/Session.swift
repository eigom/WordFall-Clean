public final class Session {
    let connection: Connection

    public init(connection: Connection) {
        self.connection = connection
    }

    func fetchSingle<Result: Decodable>(query: String, parameters: [QueryParameter]) throws -> Result? {

    }

    func fetchMany<Result: Decodable>(query: String, parameters: [QueryParameter]) throws -> [Result] {
        
    }
}

/*
 TODO: separate errors - higher level and SQLite (error code, message)

 */
