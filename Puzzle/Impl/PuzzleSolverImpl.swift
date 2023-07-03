public struct PuzzleSolverImpl: PuzzleSolver {
    public func solve(_ puzzle: WordPuzzle, using letterRevealer: PuzzleLetterRevealer) -> (WordPuzzle, [PuzzleLetter]) {
        puzzle.puzzleLetters.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Character?) throws -> Result##(Result, Character?) throws -> Result##(_ partialResult: Result, Character?) throws -> Result#>)

        let revealed = puzzle.puzzleLetters
            .enumerated()
            .map { letterRevealer.revealLetter(at: <#T##Int#>, in: <#T##WordPuzzle#>) }

        /*let revealedLetters = puzzle.solutionLetters
            .enumerated()
            .filter { $0.element == nil }
            .map {
                SolvePuzzleResult.RevealedLetter(
                    letter: puzzle.wordLetters[$0.offset],
                    solutionLetterIndex: $0.offset
                )
            }
        let newPuzzleLetters = puzzle.puzzleLetters.map { _ -> Character? in nil }
        let newSolutionLetters = puzzle.wordLetters
        let solvedPuzzle = puzzle.copy(
            puzzleLetters: newPuzzleLetters,
            solutionLetters: newSolutionLetters
        )

        return SolvePuzzleResult(
            revealedLetters: revealedLetters,
            resultingPuzzle: solvedPuzzle
        )*/
    }

    public func isSolved(_ puzzle: WordPuzzle) -> Bool {
        return puzzle.wordLetters == puzzle.solutionLetters
    }
}
