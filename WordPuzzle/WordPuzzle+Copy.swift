extension WordPuzzle {
    func copy(
        puzzleLetters: [Character?],
        solutionLetters: [Character?]
    ) -> WordPuzzle {
        return WordPuzzle(
            wordLetters: wordLetters,
            puzzleLetters: puzzleLetters,
            solutionLetters: solutionLetters
        )
    }
}
