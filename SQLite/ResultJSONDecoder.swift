//
//  Copyright 2023 Eigo Madaloja
//

struct ResultJSONDecoder {
    static func decode<T: Decodable>(jsonString: String) throws -> T {
        guard let data = jsonString.data(using: .utf8) else { throw SQLiteError.failedToConvertToData }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw SQLiteError.failedToDecodeJSON(json: jsonString, error: error)
        }
    }
}
