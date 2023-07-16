//
//  Copyright 2023 Eigo Madaloja
//

public extension AsyncSequence {
    func collect() async rethrows -> [Element] {
        try await reduce(into: [Element]()) { $0.append($1) }
    }
}
