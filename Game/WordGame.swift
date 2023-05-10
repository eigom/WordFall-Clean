import Puzzle

public protocol WordGame {
    var puzzle: WordPuzzle { get }
    var totalSolvingTimeSeconds: TimeInterval { get }
    var letterSolvingTimeSeconds: [TimeInterval] { get }

    func makeCopy(puzzle: WordPuzzle) -> WordGame
}
