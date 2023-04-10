import Puzzle

struct WordGameImpl: WordGame {
    public let puzzle: WordPuzzle
    public let totalSolvingTime: TimeInterval
    public let letterSolvingTimes: [TimeInterval]
}
