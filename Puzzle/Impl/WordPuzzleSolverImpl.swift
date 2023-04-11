public struct WordPuzzleSolverImpl: WordPuzzleSolver {
    public func tryLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterTryResult {
        let puzzleLetter = puzzle.puzzleLetters[puzzleIndex]

        guard
            let nextSolutionLetterIndex = puzzle.partialSolution
                .enumerated()
                .first(where: { $0.element == nil })?
                .offset,
            puzzle.wordLetters[nextSolutionLetterIndex] == puzzleLetter
        else { return .wrongLetter }

        let newPartialSolution = puzzle.partialSolution
            .replacingElement(at: nextSolutionLetterIndex, with: puzzleLetter)
        let newPuzzle = puzzle.makeCopy(updatingPartialSolution: newPartialSolution)

        return .correctLetter(
            puzzleLetter,
            wordIndex: nextSolutionLetterIndex,
            resultingPuzzle: newPuzzle
        )
    }

    public func solve(_ puzzle: WordPuzzle) -> SolvePuzzleResult {
        let revealedLetters = puzzle.partialSolution
            .enumerated()
            .filter { $0.element == nil }
            .map {
                SolvePuzzleResult.RevealedLetter(
                    letter: puzzle.wordLetters[$0.offset],
                    wordIndex: $0.offset
                )
            }
        let solvedPuzzle = puzzle.makeCopy(updatingPartialSolution: puzzle.wordLetters)

        return SolvePuzzleResult(
            revealedLetters: revealedLetters,
            resultingPuzzle: solvedPuzzle
        )
    }

    public func isSolved(_ puzzle: WordPuzzle) -> Bool {
        return puzzle.wordLetters == puzzle.partialSolution
    }
}
