public protocol PuzzleSolver {
    static func tryLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterTryResult
    static func solve(_ puzzle: WordPuzzle) -> SolvePuzzleResult
    static func isSolved(_ puzzle: WordPuzzle) -> Bool
}

public enum LetterTryResult {
    case wrongLetter
    case correctLetter(
        Character,
        wordIndex: Int,
        resultingPuzzle: WordPuzzle
    )
}

public struct SolvePuzzleResult {
    public struct RevealedLetter {
        public let letter: Character
        public let wordIndex: Int
    }

    public let revealedLetters: [RevealedLetter]
    public let resultingPuzzle: WordPuzzle
}
