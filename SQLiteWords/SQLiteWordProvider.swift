import Words

public final class SQLiteWordProvider: WordProvider {
    public var availableWordLengths: [Int] { [0] }

    public func nextWord(length: WordLength) -> Result<Word, Error> {
        enum Error: Swift.Error {
            case error
        }
        return .failure(Error.error)
    }
}
