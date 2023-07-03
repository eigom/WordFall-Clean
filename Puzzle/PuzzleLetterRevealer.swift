public protocol PuzzleLetterRevealer {
    func revealLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, PuzzleLetter?)
}
