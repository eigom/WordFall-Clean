public protocol PuzzleLetterRevealer {
    func revealLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, PuzzleLetter?)
}
