//
//  Copyright 2023 Eigo Madaloja
//

import WordGame
import WordGameGameplay

public struct WordGameGameplayFactoryImpl: WordGameGameplayFactory {
    private let gamePresenter: WordGameGameplayPresenter
    private let letterTrier: WordGameLetterTrier
    private let letterRevealer: WordGameLetterRevealer
    private let elapsedTimeApplier: WordGameElapsedTimeApplier
    private let timeUpdater: WordGameGameplayTimeUpdater

    public func makeGameplay(with wordGame: WordGame) -> WordGameGameplay {
        return WordGameGameplayImpl(
            wordGame: wordGame,
            gamePresenter: gamePresenter,
            letterTrier: letterTrier,
            letterRevealer: letterRevealer,
            elapsedTimeApplier: elapsedTimeApplier,
            timeUpdater: timeUpdater
        )
    }
}
