import Words
import Common

extension SQLiteWordProvider: WordProvider {
    public var availableWordLengths: Try<[UInt]> {
        Try { try fetchWordLengths() }
    }

    public func nextWord(length: WordLength) -> Try<Words.Word> {
        Try {
            let availableLengths = try self.availableWordLengths.get
            let wordLength = try wordLength(for: length, availableLengths: availableLengths)
            let word = try fetchRandomWord(length: wordLength)
            let definitions = try fetchDefinitions(wordID: word.id)

            return Words.Word(word: word, definitions: definitions)
        }
    }

    private func wordLength(for length: WordLength, availableLengths: [UInt]) throws -> UInt {
        switch length {
        case .fixed(let length):
            return length
        case .any(let maxLength):
            return availableLengths
                .filter { $0 <= maxLength }
                .randomElement() ?? 0
        }
    }
}

private extension Words.Word {
    init(word: Word, definitions: [Definition]) {
        self.init(word: word.word, definitions: definitions.map { .init(definition: $0) })
    }
}

private extension Words.Definition {
    init(definition: Definition) {
        self.init(type: definition.type, definition: definition.definition)
    }
}
