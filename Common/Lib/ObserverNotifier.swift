public class ObserverNotifier<Notification> {
    private var observers = [() -> (AnyObject?, (Notification) -> Void)]()

    public init() {}

    public func addObserver(_ observer: AnyObject, onNotified: @escaping (Notification) -> Void) {
        guard !observers.contains(where: { $0().0 === observer }) else { return }

        observers.append({ [weak observer] in (observer, onNotified) })
    }

    public func removeObserver(_ observer: AnyObject) {
        observers.removeAll(where: { $0().0 === observer })
    }

    public func notify(_ notification: Notification) {
        observers
            .compactMap { $0().1 }
            .forEach { onNotified in onNotified(notification) }
    }
}
