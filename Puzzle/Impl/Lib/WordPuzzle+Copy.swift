extension WordPuzzle {
    func makeCopy(partialSolution: [Character?]) -> WordPuzzleImpl {
        return .init(
            wordLetters: wordLetters,
            puzzleLetters: puzzleLetters,
            partialSolution: partialSolution
        )
    }
}
