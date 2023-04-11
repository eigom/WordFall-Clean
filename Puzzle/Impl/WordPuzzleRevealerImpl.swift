public struct WordPuzzleRevealerImpl: WordPuzzleRevealer {
    public func revealLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterRevealResult {
        let puzzleLetter = puzzle.puzzleLetters[puzzleIndex]

        guard
            let solutionLetterIndex = puzzle.partialSolution
                .enumerated()
                .first(where: {
                    $0.element == nil && puzzle.wordLetters[$0.offset] == puzzleLetter
                })?
                .offset
        else { return .none }

        let newPartialSolution = puzzle.partialSolution
            .replacingElement(at: solutionLetterIndex, with: puzzleLetter)
        let newPuzzle = puzzle.makeCopy(updatingPartialSolution: newPartialSolution)

        return .revealedLetter(
            puzzleLetter,
            wordIndex: solutionLetterIndex,
            resultingPuzzle: newPuzzle
        )
    }
}
