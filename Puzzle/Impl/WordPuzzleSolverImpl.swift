public struct WordPuzzleSolverImpl: WordPuzzleSolver {
    public func tryLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> LetterTryingResult {
        let puzzleLetter = puzzle.puzzleLetters[puzzleLetterIndex]

        guard
            let nextSolutionLetterIndex = puzzle.partialSolution
                .enumerated()
                .first(where: { $0.element == nil })?
                .offset,
            puzzle.wordLetters[nextSolutionLetterIndex] == puzzleLetter
        else {
            return LetterTryingResult(
                wasCorrectLetter: false,
                isPuzzleSolved: puzzle.wordLetters == puzzle.partialSolution,
                resultingPuzzle: puzzle
            )
        }

        let newPartialSolution = puzzle.partialSolution.replacingElement(
            at: nextSolutionLetterIndex,
            with: puzzleLetter
        )

        return LetterTryingResult(
            wasCorrectLetter: true,
            isPuzzleSolved: puzzle.wordLetters == puzzle.partialSolution,
            resultingPuzzle: puzzle.makeCopy(partialSolution: newPartialSolution)
        )
    }
}
