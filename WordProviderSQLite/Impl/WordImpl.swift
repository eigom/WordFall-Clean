import WordProvider

public struct WordImpl: Word {
    public let word: String
    public let definitions: [Definition]

    init(word: SQLiteWordsDatabase.Word, definitions: [SQLiteWordsDatabase.Definition]) {
        self.word = word.word
        self.definitions = definitions.map { DefinitionImpl(definition: $0) }
    }
}
