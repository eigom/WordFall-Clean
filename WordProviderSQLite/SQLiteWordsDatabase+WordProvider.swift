import WordProvider
import Common

extension SQLiteWordsDatabase: WordProvider {
    public var availableWordLengths: Try<[UInt]> {
        Try { try fetchWordLengths() }
    }

    public func nextWord(length: WordLength, maximumLength: UInt) -> Try<Word> {
        Try {
            let availableLengths = try self.availableWordLengths.get
            let wordLength = try wordLength(
                for: length,
                availableLengths: availableLengths,
                maximumLength: maximumLength
            )
            let word = try fetchRandomWord(length: wordLength)
            let definitions = try fetchDefinitions(wordID: word.id)

            return WordImpl(word: word, definitions: definitions)
        }
    }

    private func wordLength(
        for length: WordLength,
        availableLengths: [UInt],
        maximumLength: UInt
    ) throws -> UInt {
        switch length {
        case .fixed(let length):
            return length
        case .any:
            return availableLengths
                .filter { $0 <= maximumLength }
                .randomElement() ?? 0
        }
    }
}
