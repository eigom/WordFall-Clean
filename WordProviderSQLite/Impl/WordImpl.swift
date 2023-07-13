import WordProvider

public struct WordImpl: Word {
    public let word: String
    public let definitions: [Definition]

    init(word: DBWord, definitions: [DBDefinition]) {
        self.word = word.word
        self.definitions = definitions.map { DefinitionImpl(definition: $0) }
    }
}
