//
//  Copyright 2023 Eigo Madaloja
//

import Common

public protocol WordProvider {
    var availableWordLengths: Try<[UInt]> { get }
    func nextWord(length: WordLength, maximumLength: UInt) -> Try<Word>
}

public enum WordLength {
    case fixed(length: UInt)
    case any
}

public protocol Word {
    var word: String { get }
    var definitions: [Definition] { get }
}

public protocol Definition {
    var type: String { get }
    var definition: String { get }
}
