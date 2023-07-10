public struct WordPuzzleLetterTrierImpl: WordPuzzleLetterTrier {
    public func tryLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, WordPuzzleLetter?) {
        guard
            let puzzleLetter = puzzle.puzzleLetters[puzzleLetterIndex],
            let solutionLetterIndex = puzzle.solutionLetters
                .enumerated()
                .first(where: { $0.element == nil })?
                .offset,
            puzzle.wordLetters[solutionLetterIndex] == puzzleLetter
        else { return (puzzle, nil) }

        let newPuzzleLetters = puzzle.puzzleLetters
            .replacingElement(at: puzzleLetterIndex, with: nil)
        let newSolutionLetters = puzzle.solutionLetters
            .replacingElement(at: solutionLetterIndex, with: puzzleLetter)
        let newPuzzle = puzzle.copy(
            puzzleLetters: newPuzzleLetters,
            solutionLetters: newSolutionLetters
        )
        let solvedLetter = WordPuzzleLetter(
            letter: puzzleLetter,
            puzzleIndex: puzzleLetterIndex,
            solutionIndex: solutionLetterIndex
        )

        return (newPuzzle, solvedLetter)
    }
}
