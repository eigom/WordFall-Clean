public struct WordPuzzleLetterRevealerImpl: WordPuzzleLetterRevealer {
    public func revealLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, WordPuzzleLetter?) {
        guard
            let puzzleLetter = puzzle.puzzleLetters[puzzleLetterIndex],
            let solutionLetterIndex = puzzle.solutionLetters
                .enumerated()
                .first(where: {
                    $0.element == nil && puzzle.wordLetters[$0.offset] == puzzleLetter
                })?
                .offset
        else { return (puzzle, nil) }

        let newPuzzleLetters = puzzle.puzzleLetters
            .replacingElement(at: puzzleLetterIndex, with: nil)
        let newSolutionLetters = puzzle.solutionLetters
            .replacingElement(at: solutionLetterIndex, with: puzzleLetter)
        let newPuzzle = puzzle.copy(
            puzzleLetters: newPuzzleLetters,
            solutionLetters: newSolutionLetters
        )
        let revealedLetter = WordPuzzleLetter(
            letter: puzzleLetter,
            puzzleIndex: puzzleLetterIndex,
            solutionIndex: solutionLetterIndex
        )

        return (newPuzzle, revealedLetter)
    }

    public func revealLetters(
        at puzzleLetterIndexes: [Int],
        in puzzle: WordPuzzle) -> (WordPuzzle, [WordPuzzleLetter]
    ) {
        return puzzleLetterIndexes.reduce((puzzle, [WordPuzzleLetter]())) { partialResult, index in
            let (puzzle, letters) = partialResult
            let (newPuzzle, revealedLetter) = revealLetter(at: index, in: puzzle)
            return (newPuzzle, letters + [revealedLetter].compactMap { $0 })
        }
    }

    public func revealAllLetters(in puzzle: WordPuzzle) -> (WordPuzzle, [WordPuzzleLetter]) {
        return revealLetters(at: Array(0 ..< puzzle.puzzleLetters.count), in: puzzle)
    }
}
