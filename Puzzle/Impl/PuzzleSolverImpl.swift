public struct PuzzleSolverImpl: PuzzleSolver {
    public func solve(_ puzzle: WordPuzzle) -> SolvePuzzleResult {
        let revealedLetters = puzzle.solutionLetters
            .enumerated()
            .filter { $0.element == nil }
            .map {
                SolvePuzzleResult.RevealedLetter(
                    letter: puzzle.wordLetters[$0.offset],
                    solutionLetterIndex: $0.offset
                )
            }
        let newPuzzleLetters = puzzle.puzzleLetters.map { _ -> Character? in nil }
        let newSolutionLetters = puzzle.wordLetters
        let solvedPuzzle = puzzle.copy(
            puzzleLetters: newPuzzleLetters,
            solutionLetters: newSolutionLetters
        )

        return SolvePuzzleResult(
            revealedLetters: revealedLetters,
            resultingPuzzle: solvedPuzzle
        )
    }

    public func isSolved(_ puzzle: WordPuzzle) -> Bool {
        return puzzle.wordLetters == puzzle.solutionLetters
    }
}
