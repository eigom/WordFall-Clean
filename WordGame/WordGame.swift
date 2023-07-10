import WordPuzzle

public struct WordGame {
    public let puzzle: WordPuzzle
    public let totalSolvingTimeSeconds: TimeInterval
    public let letterSolvingTimeSeconds: [TimeInterval]
}
