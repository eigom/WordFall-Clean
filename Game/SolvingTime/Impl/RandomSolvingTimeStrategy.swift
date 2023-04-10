struct RandomSolvingTimeStrategy: SolvingTimeStrategy {
    let letterSolvingTimes: [TimeInterval]

    init(wordLength: Int) {
        let maxSeconds = TimeInterval(wordLength * 10)

        letterSolvingTimes = (0 ..< wordLength)
            .map { _ in maxSeconds * TimeInterval.random(in: 0.8...maxSeconds) }
    }
}
