//
//  Copyright 2023 Eigo Madaloja
//

import WordGame
import WordGameGameplay
import Foundation

public class WordGameGameplayImpl: WordGameGameplay {
    private var wordGame: WordGame
    private let gamePresenter: WordGameGameplayPresenter
    private let letterTrier: WordGameLetterTrier
    private let letterRevealer: WordGameLetterRevealer
    private let elapsedTimeApplier: WordGameElapsedTimeApplier
    private let timeUpdater: WordGameGameplayTimeUpdater

    init(
        wordGame: WordGame,
        gamePresenter: WordGameGameplayPresenter,
        letterTrier: WordGameLetterTrier,
        letterRevealer: WordGameLetterRevealer,
        elapsedTimeApplier: WordGameElapsedTimeApplier,
        timeUpdater: WordGameGameplayTimeUpdater
    ) {
        self.wordGame = wordGame
        self.gamePresenter = gamePresenter
        self.letterTrier = letterTrier
        self.letterRevealer = letterRevealer
        self.elapsedTimeApplier = elapsedTimeApplier
        self.timeUpdater = timeUpdater
    }

    public func start() {
        gamePresenter.setupNewGame(
            puzzleLetters: wordGame.puzzle.puzzleLetters.compactMap { $0 },
            letterSolvingTimeSeconds: wordGame.letterSolvingTimeSeconds,
            totalSolvingTimeSeconds: wordGame.totalSolvingTimeSeconds,
            finished: {
                timeUpdater.start(durationSeconds: wordGame.totalSolvingTimeSeconds) { elapsedSeconds in
                    applyElapsedSeconds(elapsedSeconds)
                }
            }
        )
    }

    public func tryLetter(at puzzleLetterIndex: Int) {
        let (newWordGame, solvedLetter) = letterTrier.tryLetter(at: puzzleLetterIndex, in: wordGame)

        wordGame = newWordGame

        if let solvedLetter {
            gamePresenter.revealSolvedLetter(solvedLetter)
        }
    }

    public func revealAllLetters() {
        let (newWordGame, revealedLetters) = letterRevealer.revealAllLetters(in: wordGame)

        wordGame = newWordGame

        if !revealedLetters.isEmpty {
            gamePresenter.revealLetters(revealedLetters)
        }
    }

    private func applyElapsedSeconds(_ elapsedSeconds: TimeInterval) {
        let (newWordGame, revealedLetters) = elapsedTimeApplier.applyElapsedSeconds(elapsedSeconds, to: wordGame)

        wordGame = newWordGame

        if !revealedLetters.isEmpty {
            gamePresenter.revealLetters(revealedLetters)
        }

        gamePresenter.updateLetterSolvingTimeSeconds(wordGame.letterSolvingTimeSeconds)
    }
}
