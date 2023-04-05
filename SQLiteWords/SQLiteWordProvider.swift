import Words
import SQLite

public final class SQLiteWordProvider {
    public enum Error: Swift.Error {
        case missingDatabase
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

    /*
     SELECT * FROM word WHERE id = (
     SELECT abs(random() % (last_word_id - first_word_id)) AS wordID
     FROM word_length_ids
     WHERE length = 3)

     use availableWordLengths method to get random length, then use above sql
     */
}

extension SQLiteWordProvider: WordProvider {
    public var availableWordLengths: [UInt] { [0] }

    public func nextWord(length: WordLength) -> Result<Word, Error> {
        enum Error: Swift.Error {
            case error
        }
        return .failure(Error.error)
    }
}
