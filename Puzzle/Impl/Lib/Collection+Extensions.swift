extension Collection {
    func replacingElement(at index: Int, with element: Element) -> [Element] {
        return Array(prefix(index)) + [element] + Array(dropFirst(index + 1))
    }
}
