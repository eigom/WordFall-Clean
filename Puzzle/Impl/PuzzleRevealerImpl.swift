public struct PuzzleRevealerImpl: PuzzleRevealer {
    public func revealLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterRevealResult {
        guard
            let puzzleLetter = puzzle.puzzleLetters[puzzleIndex],
            let solutionLetterIndex = puzzle.solutionLetters
                .enumerated()
                .first(where: {
                    $0.element == nil && puzzle.wordLetters[$0.offset] == puzzleLetter
                })?
                .offset
        else { return .none }

        let newPuzzleLetters = puzzle.puzzleLetters
            .replacingElement(at: puzzleIndex, with: nil)
        let newSolutionLetters = puzzle.solutionLetters
            .replacingElement(at: solutionLetterIndex, with: puzzleLetter)
        let newPuzzle = puzzle.makeCopy(
            newPuzzleLetters: newPuzzleLetters,
            newSolutionLetters: newSolutionLetters
        )

        return .revealedLetter(
            puzzleLetter,
            wordIndex: solutionLetterIndex,
            resultingPuzzle: newPuzzle
        )
    }
}
