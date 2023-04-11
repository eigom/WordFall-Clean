import Puzzle

public struct WordGameImpl: WordGame {
    public let puzzle: WordPuzzle
    public let totalSolvingTimeSeconds: TimeInterval
    public let letterSolvingTimeSeconds: [TimeInterval]

    public func makeCopy(newPuzzle: WordPuzzle) -> WordGame {
        return WordGameImpl(
            puzzle: newPuzzle,
            totalSolvingTimeSeconds: totalSolvingTimeSeconds,
            letterSolvingTimeSeconds: letterSolvingTimeSeconds
        )
    }
}
