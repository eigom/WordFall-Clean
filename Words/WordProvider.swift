public protocol WordProvider {
    var availableWordLengths: [UInt] { get throws }
    func nextWord(length: WordLength) throws -> Word
}

public enum WordLength {
    case fixed(length: UInt)
    case any(maxLength: UInt)
}

public struct Word {
    public let word: String
    public let definitions: [Definition]

    public init(word: String, definitions: [Definition]) {
        self.word = word
        self.definitions = definitions
    }
}

public struct Definition {
    public let type: String
    public let definition: String

    public init(type: String, definition: String) {
        self.type = type
        self.definition = definition
    }
}
