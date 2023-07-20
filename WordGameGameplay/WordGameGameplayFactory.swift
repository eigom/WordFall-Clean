//
//  Copyright 2023 Eigo Madaloja
//

import WordGame
import WordProvider
import Common

public protocol WordGameGameplayFactory {
    func makeGameplay(wordLength: WordLength) -> Try<WordGameGameplay>
}
