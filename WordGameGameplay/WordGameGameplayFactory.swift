//
//  Copyright 2023 Eigo Madaloja
//

import WordGame

public protocol WordGameGameplayFactory {
    func makeGameplay(with wordGame: WordGame) -> WordGameGameplay
}
