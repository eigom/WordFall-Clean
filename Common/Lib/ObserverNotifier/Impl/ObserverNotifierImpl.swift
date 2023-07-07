public class ObserverNotifierImpl<Notification>: ObserverNotifier {
    private var observers = [() -> (AnyObject?, (Notification) -> Void)]()

    public init() {}

    public func addObserver(_ observer: AnyObject, onNotify: @escaping (Notification) -> Void) {
        guard !observers.contains(where: { $0().0 === observer }) else { return }

        observers.append({ [weak observer] in (observer, onNotify) })
    }

    public func removeObserver(_ observer: AnyObject) {
        observers.removeAll(where: { $0().0 === observer })
    }

    public func notify(_ notification: Notification) {
        observers
            .compactMap { $0().1 }
            .forEach { onNotify in onNotify(notification) }
    }
}
