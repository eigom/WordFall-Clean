import Words

public final class SQLiteWordProvider: WordProvider {
    public var availableWordLengths: [Int] { [0] }

    public func nextWord(length: Words.WordLength) -> Result<Words.Word, Error> {
        return .failure(NSError())
    }
}
