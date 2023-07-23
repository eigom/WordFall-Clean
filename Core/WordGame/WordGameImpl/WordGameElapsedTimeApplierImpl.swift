//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import WordGame
import Foundation

public struct WordGameElapsedTimeApplierImpl: WordGameElapsedTimeApplier {
    private let letterRevealer: WordPuzzleLetterRevealer

    public init(letterRevealer: WordPuzzleLetterRevealer) {
        self.letterRevealer = letterRevealer
    }

    public func applyElapsedSeconds(
        _ elapsedSeconds: TimeInterval,
        to game: WordGame
    ) -> (WordGame, revealedLetters: [WordPuzzleLetter]) {
        let newLetterSolvingTimeSeconds = game.letterSolvingTimeSeconds
            .map { max($0 - elapsedSeconds, 0) }
        let expiredLetterIndexes = newLetterSolvingTimeSeconds
            .enumerated()
            .filter { $0.element == 0 }
            .map { $0.offset }
        let (newPuzzle, revealedLetters) = letterRevealer.revealLetters(at: expiredLetterIndexes, in: game.puzzle)
        let newGame = game.copy(
            puzzle: newPuzzle,
            letterSolvingTimeSeconds: newLetterSolvingTimeSeconds
        )

        return (newGame, revealedLetters: revealedLetters)
    }
}
