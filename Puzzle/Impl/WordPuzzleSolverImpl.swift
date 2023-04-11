public struct WordPuzzleSolverImpl: WordPuzzleSolver {
    public func tryLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> LetterTryResult {
        let puzzleLetter = puzzle.puzzleLetters[puzzleLetterIndex]

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
        let isPuzzleSolved = puzzle.wordLetters == puzzle.partialSolution

        return .correctLetter(
            isPuzzleSolved: isPuzzleSolved,
            resultingPuzzle: newPuzzle
        )
    }

    public func solve(_ puzzle: WordPuzzle) -> SolvePuzzleResult {
        let revealedLetters = puzzle.partialSolution
            .enumerated()
            .filter { $0.element == nil }
            .map {
                let letter = puzzle.wordLetters[$0.offset]
                return SolvePuzzleResult.RevealedLetter(
                    letter: letter,
                    index: $0.offset
                )
            }
        let solvedPuzzle = puzzle.makeCopy(updatingPartialSolution: puzzle.wordLetters)

        return SolvePuzzleResult(
            revealedLetters: revealedLetters,
            resultingPuzzle: solvedPuzzle
        )
    }
}
