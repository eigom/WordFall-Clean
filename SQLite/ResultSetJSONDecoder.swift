final class ResultSetJSONDecoder {
    private let jsonString: String

    init(jsonString: String) {
        self.jsonString = jsonString
    }

    func decode<T: Decodable>() throws -> T {
        guard let data = jsonString.data(using: .utf8) else { throw SQLiteError.failedToConvertToData }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw SQLiteError.failedToConvertToJSON(error)
        }
    }
}
