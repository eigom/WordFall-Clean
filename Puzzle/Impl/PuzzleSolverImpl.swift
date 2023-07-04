public struct PuzzleSolverImpl: PuzzleSolver {
    public func solve(_ puzzle: WordPuzzle, using letterRevealer: PuzzleLetterRevealer) -> (WordPuzzle, [PuzzleLetter]) {
        puzzle.puzzleLetters
            .reduce((puzzle, [PuzzleLetter]())) { partialResult, _ in
                let (puzzle, letters) = partialResult
                let (newPuzzle, revealedLetter) = letterRevealer.revealLetter(at: letters.count, in: puzzle)
                return (newPuzzle, letters + [revealedLetter].compactMap { $0 })
            }
    }

    public func isSolved(_ puzzle: WordPuzzle) -> Bool {
        return puzzle.wordLetters == puzzle.solutionLetters
    }
}
