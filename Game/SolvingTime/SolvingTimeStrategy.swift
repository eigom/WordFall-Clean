public protocol SolvingTimeStrategy {
    init(wordLength: Int)

    var totalSolvingTimeSeconds: TimeInterval { get }
    var letterSolvingTimeSeconds: [TimeInterval] { get }
}
