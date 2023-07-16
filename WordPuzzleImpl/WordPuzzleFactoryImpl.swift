import WordPuzzle
import WordProvider
import Common

public struct WordPuzzleFactoryImpl: WordPuzzleFactory {
    private let wordProvider: WordProvider
    private let maximumWordLength: UInt

    public init(wordProvider: WordProvider, maximumWordLength: UInt) {
        self.wordProvider = wordProvider
        self.maximumWordLength = maximumWordLength
    }

    public func makePuzzle(wordLength: WordLength) -> Try<WordPuzzle> {
        let word = wordProvider.nextWord(
            length: wordLength,
            maximumLength: maximumWordLength
        )

        return word.map { word in
            WordPuzzleImpl(
                wordLetters: Array(word.word),
                puzzleLetters: word.word.shuffled(),
                solutionLetters: Array(repeating: nil, count: word.word.count)
            )
        }
    }
}
