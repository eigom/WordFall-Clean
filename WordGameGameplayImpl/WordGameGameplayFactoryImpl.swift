//
//  Copyright 2023 Eigo Madaloja
//

import WordGame
import WordGameGameplay
import WordProvider
import Common

public struct WordGameGameplayFactoryImpl: WordGameGameplayFactory {
    private let wordGameFactory: WordGameFactory
    private let gamePresenter: WordGameGameplayPresenter
    private let letterTrier: WordGameLetterTrier
    private let letterRevealer: WordGameLetterRevealer
    private let elapsedTimeApplier: WordGameElapsedTimeApplier
    private let timeUpdater: WordGameGameplayTimeUpdater

    public init(
        wordGameFactory: WordGameFactory,
        gamePresenter: WordGameGameplayPresenter,
        letterTrier: WordGameLetterTrier,
        letterRevealer: WordGameLetterRevealer,
        elapsedTimeApplier: WordGameElapsedTimeApplier,
        timeUpdater: WordGameGameplayTimeUpdater
    ) {
        self.wordGameFactory = wordGameFactory
        self.gamePresenter = gamePresenter
        self.letterTrier = letterTrier
        self.letterRevealer = letterRevealer
        self.elapsedTimeApplier = elapsedTimeApplier
        self.timeUpdater = timeUpdater
    }

    public func makeGameplay(wordLength: WordLength) -> Try<WordGameGameplay> {
        return wordGameFactory.makeGame(wordLength: wordLength)
            .map { wordGame in
                WordGameGameplayImpl(
                    wordGame: wordGame,
                    gamePresenter: gamePresenter,
                    letterTrier: letterTrier,
                    letterRevealer: letterRevealer,
                    elapsedTimeApplier: elapsedTimeApplier,
                    timeUpdater: timeUpdater
                )
            }
    }
}
