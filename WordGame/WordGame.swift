import WordPuzzle

public struct WordGame {
    public let puzzle: WordPuzzle
    public let totalSolvingTimeSeconds: TimeInterval
    public let letterSolvingTimeSeconds: [TimeInterval]
}

extension WordGame {
    func copy(puzzle: WordPuzzle, letterSolvingTimeSeconds: [TimeInterval]) -> WordGame {
        return WordGame(
            puzzle: puzzle,
            totalSolvingTimeSeconds: totalSolvingTimeSeconds,
            letterSolvingTimeSeconds: letterSolvingTimeSeconds
        )
    }
}