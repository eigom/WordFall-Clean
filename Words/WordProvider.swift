public protocol WordProvider {
    func word(length: WordLength) -> Word
}

public enum WordLength {
    case fixed(length: UInt)
    case any
}

public struct Word {
    public let word: String
    public let definitions: [Definition]
}

public struct Definition {
    public let type: String
    public let definition: String

    public init(type: String, definition: String) {
        self.type = type
        self.definition = definition
    }
}
