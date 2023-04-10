public protocol SolvingTimeStrategy {
    init(wordLength: Int)

    var letterSolvingTimes: [TimeInterval] { get }
}
