public protocol WordPuzzleSolver {
    func tryLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> LetterTryResult
    func solve(_ puzzle: WordPuzzle) -> SolvePuzzleResult
}

public enum LetterTryResult {
    case wrongLetter
    case correctLetter(isPuzzleSolved: Bool, resultingPuzzle: WordPuzzle)
}

public struct SolvePuzzleResult {
    public struct RevealedLetter {
        public let letter: Character
        public let index: Int
    }

    public let revealedLetters: [RevealedLetter]
    public let resultingPuzzle: WordPuzzle
}
