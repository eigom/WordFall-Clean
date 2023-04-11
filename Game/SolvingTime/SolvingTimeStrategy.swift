public protocol SolvingTimeStrategy {
    init(wordLength: Int)

    var totalSolvingTimeSeconds: TimeInterval
    var letterSolvingTimeSeconds: [TimeInterval] { get }
}
