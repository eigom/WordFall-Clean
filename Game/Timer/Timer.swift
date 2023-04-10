public protocol Timer {
    init(durationSeconds: TimeInterval, onUpdate: (TimeInterval) -> Void)

    func start()
    func pause()
    func resume()
}
