public struct PuzzleLetterRevealerImpl: PuzzleLetterRevealer {
    public func revealLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, PuzzleLetter?) {
        guard
            let puzzleLetter = puzzle.puzzleLetters[puzzleIndex],
            let solutionLetterIndex = puzzle.solutionLetters
                .enumerated()
                .first(where: {
                    $0.element == nil && puzzle.wordLetters[$0.offset] == puzzleLetter
                })?
                .offset
        else { return (puzzle, nil) }

        let newPuzzleLetters = puzzle.puzzleLetters
            .replacingElement(at: puzzleIndex, with: nil)
        let newSolutionLetters = puzzle.solutionLetters
            .replacingElement(at: solutionLetterIndex, with: puzzleLetter)
        let newPuzzle = puzzle.copy(
            puzzleLetters: newPuzzleLetters,
            solutionLetters: newSolutionLetters
        )
        let revealedLetter = PuzzleLetter(
            letter: puzzleLetter,
            puzzleIndex: puzzleIndex,
            solutionIndex: solutionLetterIndex
        )

        return (newPuzzle, revealedLetter)
    }
}
