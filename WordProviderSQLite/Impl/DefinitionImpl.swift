import WordProvider

public struct DefinitionImpl: Definition {
    public let type: String
    public let definition: String

    init(definition: SQLiteWordsDatabase.Definition) {
        self.type = definition.type
        self.definition = definition.definition
    }
}
