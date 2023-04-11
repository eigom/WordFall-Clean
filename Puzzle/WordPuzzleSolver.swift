public protocol WordPuzzleSolver {
    func tryLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterTryResult
    func solve(_ puzzle: WordPuzzle) -> SolvePuzzleResult
    func isSolved(_ puzzle: WordPuzzle) -> Bool
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
