public struct WordPuzzleRevealerImpl: WordPuzzleRevealer {
    public func revealLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> LetterRevealResult {
        let puzzleLetter = puzzle.puzzleLetters[puzzleLetterIndex]

        guard
            let solutionLetterIndex = puzzle.partialSolution
                .enumerated()
                .first(where: {
                    $0.element == nil && puzzle.wordLetters[$0.offset] == puzzleLetter
                })?
                .offset
        else { return .none }

        let newPartialSolution = puzzle.partialSolution
            .replacingElement(
                at: solutionLetterIndex,
                with: puzzleLetter
            )
        let newPuzzle = puzzle.makeCopy(partialSolution: newPartialSolution)
        let isPuzzleSolved = puzzle.wordLetters == puzzle.partialSolution

        return .revealedLetter(
            puzzleLetter,
            isPuzzleSolved: isPuzzleSolved,
            resultingPuzzle: newPuzzle
        )
    }
}
