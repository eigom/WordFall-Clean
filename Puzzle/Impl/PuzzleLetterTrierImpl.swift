public struct PuzzleLetterTrierImpl: PuzzleLetterTrier {
    public func tryLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> LetterTryResult {
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
            solutionLetterIndex: nextSolutionLetterIndex,
            resultingPuzzle: newPuzzle
        )
    }
}
