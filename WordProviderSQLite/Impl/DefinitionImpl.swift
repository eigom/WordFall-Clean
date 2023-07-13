import WordProvider

public struct DefinitionImpl: Definition {
    public let type: String
    public let definition: String

    init(definition: DBDefinition) {
        self.type = definition.type
        self.definition = definition.definition
    }
}
