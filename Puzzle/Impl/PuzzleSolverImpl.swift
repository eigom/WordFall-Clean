public struct PuzzleSolverImpl: PuzzleSolver {
    public func solve(
        _ puzzle: WordPuzzle,
        using letterRevealer: PuzzleLetterRevealer
    ) -> (WordPuzzle, [PuzzleLetter]) {
        return letterRevealer.revealLetters(at: Array(0 ..< puzzle.puzzleLetters.count), in: puzzle)
    }

    public func isSolved(_ puzzle: WordPuzzle) -> Bool {
        return puzzle.wordLetters == puzzle.solutionLetters
    }
}
