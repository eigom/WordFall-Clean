import WordPuzzle

extension WordGame {
    func copy(puzzle: WordPuzzle, letterSolvingTimeSeconds: [TimeInterval]) -> WordGame {
        return WordGame(
            puzzle: puzzle,
            totalSolvingTimeSeconds: totalSolvingTimeSeconds,
            letterSolvingTimeSeconds: letterSolvingTimeSeconds
        )
    }
}
