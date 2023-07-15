public protocol WordGameGameplayTimeUpdater {
    func start(
        durationSeconds: TimeInterval,
        onUpdate: (_ elapsedSeconds: TimeInterval) -> Void
    )
    func pause()
    func resume()
    func finish()
}