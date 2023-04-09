public protocol WordPuzzleRevealer {
    func revealLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> LetterRevealResult
}

public enum LetterRevealResult {
    case none
    case revealedLetter(Character, isPuzzleSolved: Bool, resultingPuzzle: WordPuzzle)
}
