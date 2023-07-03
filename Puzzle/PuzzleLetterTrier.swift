public protocol PuzzleLetterTrier {
    func tryLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterTryResult
}

public enum LetterTryResult {
    case wrongLetter
    case correctLetter(
        Character,
        solutionLetterIndex: Int,
        resultingPuzzle: WordPuzzle
    )
}
