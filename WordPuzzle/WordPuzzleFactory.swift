//
//  Copyright 2023 Eigo Madaloja
//

import Common
import WordProvider

public protocol WordPuzzleFactory {
    func makePuzzle(wordLength: WordLength) -> Try<WordPuzzle>
}
