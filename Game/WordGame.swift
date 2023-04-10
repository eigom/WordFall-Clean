import Puzzle

public protocol WordGame {
    var puzzle: WordPuzzle { get }
    var totalSolvingTime: TimeInterval { get }
    var letterSolvingTimes: [TimeInterval] { get }
}
