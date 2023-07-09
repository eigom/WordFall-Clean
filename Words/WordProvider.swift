import Common

public protocol WordProvider {
    var availableWordLengths: Try<[UInt]> { get }
    func nextWord(length: WordLength, maximumLength: UInt) -> Try<Word>
}

public enum WordLength {
    case fixed(length: UInt)
    case any
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
