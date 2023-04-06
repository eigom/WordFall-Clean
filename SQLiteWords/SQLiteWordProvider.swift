import Words
import SQLite

private struct Word: Decodable {
    let id: Int64
    let word: String
}

private struct Definition: Decodable {
    let type: String
    let definition: String
}

public final class SQLiteWordProvider {
    public enum Error: Swift.Error {
        case missingDatabase
        case wordNotFound
    }

    private let session: Session

    init() throws {
        guard
            let databasePath = Bundle(for: Self.self).path(forResource: "words", ofType: "sqlite")
        else { throw Error.missingDatabase }

        let connection = try Connection(databasePath: databasePath)
        session = Session(connection: connection)
    }

    private func fetchWordLengths() throws -> [UInt] {
        return try session.fetch(
            "SELECT length FROM word_length_ids ORDER BY length",
            parameters: [],
            resultTypes: [.integer]
        )
    }

    private func fetchRandomWord(length: UInt) throws -> Word {
        let result: [Word] = try session.fetch(
            """
            SELECT id, word FROM word WHERE id = (
                SELECT abs(random() % (last_word_id - first_word_id)) AS wordID
                FROM word_length_ids
                WHERE length = :length
            )
            """,
            parameters: [.integer(Int64(length), name: "length")],
            resultTypes: [.integer, .text]
        )

        guard let word = result.first else { throw Error.wordNotFound }

        return word
    }

    private func fetchDefinitions(wordID: Int64) throws -> [Definition] {
        return try session.fetch(
            """
            SELECT type, definition from definition
            INNER JOIN word_definition ON definition.id = word_definition.definition_id
            WHERE word_definition.word_id = :wordID
            """,
            parameters: [.integer(wordID, name: "wordID")],
            resultTypes: [.text, .text]
        )
    }
}

extension SQLiteWordProvider: WordProvider {
    public var availableWordLengths: [UInt] {
        get throws { try fetchWordLengths() }
    }

    public func nextWord(length: WordLength) throws -> Words.Word {
        let wordLength = try wordLength(for: length)
        let word = try fetchRandomWord(length: wordLength)
        let definitions = try fetchDefinitions(wordID: word.id)

        return Words.Word(word: word, definitions: definitions)
    }

    private func wordLength(for length: WordLength) throws -> UInt {
        switch length {
        case .fixed(let length):
            return length
        case .any(let maxLength):
            return try availableWordLengths
                .filter { $0 <= maxLength }
                .randomElement() ?? 0
        }
    }
}

private extension Words.Word {
    init(word: Word, definitions: [Definition]) {
        self.init(word: word.word, definitions: definitions.map { .init(definition: $0) })
    }
}

private extension Words.Definition {
    init(definition: Definition) {
        self.init(type: definition.type, definition: definition.definition)
    }
}
