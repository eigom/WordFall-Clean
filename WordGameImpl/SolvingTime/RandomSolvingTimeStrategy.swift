import WordGame

struct RandomSolvingTimeStrategy: SolvingTimeStrategy {
    let totalSolvingTimeSeconds: TimeInterval
    let letterSolvingTimeSeconds: [TimeInterval]

    init(wordLength: Int) {
        let maxSeconds = TimeInterval(wordLength * 10)

        letterSolvingTimeSeconds = (0 ..< wordLength)
            .map { _ in maxSeconds * TimeInterval.random(in: 0.8...maxSeconds) }
        totalSolvingTimeSeconds = letterSolvingTimeSeconds.max() ?? 0
    }
}
