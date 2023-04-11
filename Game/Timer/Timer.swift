public protocol Timer {
    func start(
        durationSeconds: TimeInterval,
        onUpdate: (TimeInterval) -> Void,
        onFinished: () -> Void
    )
    func pause()
    func resume()
}
