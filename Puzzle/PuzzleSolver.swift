public protocol PuzzleSolver {
    func solve(_ puzzle: WordPuzzle, using letterRevealer: PuzzleLetterRevealer) -> (WordPuzzle, [PuzzleLetter])
    func isSolved(_ puzzle: WordPuzzle) -> Bool
}
