//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import WordProvider
import Common

public protocol WordGameFactory {
    func makeGame(wordLength: WordLength) -> Try<WordGame>
}
