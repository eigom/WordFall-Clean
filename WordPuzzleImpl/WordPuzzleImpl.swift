import WordPuzzle

public struct WordPuzzleImpl: WordPuzzle {
    public let wordLetters: [Character]
    public let puzzleLetters: [Character?]
    public let solutionLetters: [Character?]
    public var isSolved: Bool { wordLetters == solutionLetters }

    public func copy(puzzleLetters: [Character?], solutionLetters: [Character?]) -> WordPuzzle {
        return WordPuzzleImpl(
            wordLetters: wordLetters,
            puzzleLetters: puzzleLetters,
            solutionLetters: solutionLetters
        )
    }
}
