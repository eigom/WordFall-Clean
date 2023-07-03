public protocol PuzzleRevealer {
    static func revealLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterRevealResult
}

public enum LetterRevealResult {
    case none
    case revealedLetter(
        Character,
        wordIndex: Int,
        resultingPuzzle: WordPuzzle
    )
}
