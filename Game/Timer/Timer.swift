public protocol Timer {
    func start(durationSeconds: TimeInterval, onUpdate: (TimeInterval) -> Void)
    func pause()
    func resume()
}
