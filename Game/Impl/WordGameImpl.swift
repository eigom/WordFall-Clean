import Puzzle

public struct WordGameImpl: WordGame {
    public let puzzle: WordPuzzle
    public let totalSolvingTimeSeconds: TimeInterval
    public let letterSolvingTimeSeconds: [TimeInterval]

    public func copy(puzzle: WordPuzzle) -> WordGame {
        return WordGameImpl(
            puzzle: puzzle,
            totalSolvingTimeSeconds: totalSolvingTimeSeconds,
            letterSolvingTimeSeconds: letterSolvingTimeSeconds
        )
    }
}
