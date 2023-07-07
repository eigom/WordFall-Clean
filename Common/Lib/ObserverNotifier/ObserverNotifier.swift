public protocol ObserverNotifier {
    associatedtype Notification

    func addObserver(_ observer: AnyObject, onNotified: @escaping (Notification) -> Void)
    func removeObserver(_ observer: AnyObject)
    func notify(_ notification: Notification)
}
