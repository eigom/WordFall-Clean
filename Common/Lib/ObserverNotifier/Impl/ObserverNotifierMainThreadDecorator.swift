public class ObserverNotifierMainThreadDecorator<Notification, Notifier: ObserverNotifier>: ObserverNotifier
        where Notifier.Notification == Notification {
    private let notifier: Notifier

    public init(notifier: Notifier) {
        self.notifier = notifier
    }

    public func addObserver(_ observer: AnyObject, onNotified: @escaping (Notification) -> Void) {
        notifier.addObserver(observer, onNotified: onNotified)
    }

    public func removeObserver(_ observer: AnyObject) {
        notifier.removeObserver(observer)
    }

    public func notify(_ notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            self?.notifier.notify(notification)
        }
    }
}
