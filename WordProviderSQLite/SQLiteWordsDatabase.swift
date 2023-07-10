import SQLite

struct Word: Decodable {
    let id: Int64
    let word: String
}

struct Definition: Decodable {
    let type: String
    let definition: String
}

public final class SQLiteWordsDatabase {
    public enum Error: Swift.Error {
        case missingDatabase
        case wordNotFound
    }

    private let connection: Connection

    public init() throws {
        guard
            let databasePath = Bundle(for: Self.self).path(forResource: "words", ofType: "sqlite")
        else { throw Error.missingDatabase }

        connection = try Connection(databasePath: databasePath)
    }

    func fetchWordLengths() throws -> [UInt] {
        return try Database.fetch(
            "SELECT length FROM word_length_ids ORDER BY length",
            resultTypes: [.integer],
            using: connection
        )
    }

    func fetchRandomWord(length: UInt) throws -> Word {
        let result: [Word] = try Database.fetch(
            """
            SELECT id, word FROM word WHERE id = (
                SELECT first_word_id + abs(random() %  (last_word_id - first_word_id)) AS wordID
                FROM word_length_ids
                WHERE length = :length
            )
            """,
            parameters: [.integer(Int64(length), name: "length")],
            resultTypes: [.integer, .text],
            using: connection
        )

        guard let word = result.first else { throw Error.wordNotFound }

        return word
    }

    func fetchDefinitions(wordID: Int64) throws -> [Definition] {
        return try Database.fetch(
            """
            SELECT type, definition from definition
            INNER JOIN word_definition ON definition.id = word_definition.definition_id
            WHERE word_definition.word_id = :wordID
            """,
            parameters: [.integer(wordID, name: "wordID")],
            resultTypes: [.text, .text],
            using: connection
        )
    }
}
