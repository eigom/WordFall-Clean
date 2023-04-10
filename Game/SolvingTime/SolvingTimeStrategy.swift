public protocol SolvingTimeStrategy {
    init(wordLength: Int)

    var totalSolvingTime: TimeInterval
    var letterSolvingTimes: [TimeInterval] { get }
}
