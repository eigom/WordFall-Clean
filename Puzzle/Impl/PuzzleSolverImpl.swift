public enum PuzzleSolverImpl: PuzzleSolver {
    public static func tryLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterTryResult {
        guard
            let puzzleLetter = puzzle.puzzleLetters[puzzleIndex],
            let nextSolutionLetterIndex = puzzle.solutionLetters
                .enumerated()
                .first(where: { $0.element == nil })?
                .offset,
            puzzle.wordLetters[nextSolutionLetterIndex] == puzzleLetter
        else { return .wrongLetter }

        let newPuzzleLetters = puzzle.puzzleLetters
            .replacingElement(at: puzzleIndex, with: nil)
        let newSolutionLetters = puzzle.solutionLetters
            .replacingElement(at: nextSolutionLetterIndex, with: puzzleLetter)
        let newPuzzle = puzzle.copy(
            puzzleLetters: newPuzzleLetters,
            solutionLetters: newSolutionLetters
        )

        return .correctLetter(
            puzzleLetter,
            wordIndex: nextSolutionLetterIndex,
            resultingPuzzle: newPuzzle
        )
    }

    public static func solve(_ puzzle: WordPuzzle) -> SolvePuzzleResult {
        let revealedLetters = puzzle.solutionLetters
            .enumerated()
            .filter { $0.element == nil }
            .map {
                SolvePuzzleResult.RevealedLetter(
                    letter: puzzle.wordLetters[$0.offset],
                    wordIndex: $0.offset
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

    public static func isSolved(_ puzzle: WordPuzzle) -> Bool {
        return puzzle.wordLetters == puzzle.solutionLetters
    }
}
