public struct WordPuzzle {
    public let wordLetters: [Character]
    public let puzzleLetters: [Character?]
    public let solutionLetters: [Character?]
    public var isSolved: Bool { wordLetters == solutionLetters }
}

extension WordPuzzle {
    func copy(
        puzzleLetters: [Character?],
        solutionLetters: [Character?]
    ) -> WordPuzzle {
        return WordPuzzle(
            wordLetters: wordLetters,
            puzzleLetters: puzzleLetters,
            solutionLetters: solutionLetters
        )
    }
}
