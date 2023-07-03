public protocol PuzzleSolver {
    func solve(_ puzzle: WordPuzzle) -> SolvePuzzleResult
    func isSolved(_ puzzle: WordPuzzle) -> Bool
}

public struct SolvePuzzleResult {
    public struct RevealedLetter {
        public let letter: Character
        public let solutionLetterIndex: Int
    }

    public let revealedLetters: [RevealedLetter]
    public let resultingPuzzle: WordPuzzle
}
