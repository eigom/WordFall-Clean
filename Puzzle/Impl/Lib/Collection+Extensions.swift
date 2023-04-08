extension Collection {
    func element(at index: Int) -> Element {
        let elementIndex = self.index(startIndex, offsetBy: index)
        return self[elementIndex]
    }

    func replacingElement(at index: Int, with element: Element) -> [Element] {
        return Array(prefix(index)) + [element] + Array(dropFirst(index + 1))
    }
}
