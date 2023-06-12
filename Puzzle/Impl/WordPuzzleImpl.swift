public struct WordPuzzleImpl: WordPuzzle {
    public let wordLetters: [Character]
    public let puzzleLetters: [Character?]
    public let solutionLetters: [Character?]

    public func copy(
        puzzleLetters: [Character?],
        solutionLetters: [Character?]
    ) -> WordPuzzle {
        return WordPuzzleImpl(
            wordLetters: wordLetters,
            puzzleLetters: puzzleLetters,
            solutionLetters: solutionLetters
        )
    }
}
