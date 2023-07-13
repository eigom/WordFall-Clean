public protocol WordGameGameplayPresenter {
    typealias Finished = () -> Void

    func setupNewGame(
        puzzleLetters: [Character],
        letterSolvingTimeSeconds: [TimeInterval],
        totalSolvingTimeSeconds: TimeInterval,
        finished: Finished
    )
}
