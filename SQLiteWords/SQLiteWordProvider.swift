import Words

public final class SQLiteWordProvider: WordProvider {
    public func nextWord(length: Words.WordLength) -> Result<Words.Word, Error> {
        return .failure(NSError())
    }
}
