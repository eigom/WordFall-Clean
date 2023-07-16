//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import WordGame

public struct WordGameLetterRevealerImpl: WordGameLetterRevealer {
    private let letterRevealer: WordPuzzleLetterRevealer

    public init(letterRevealer: WordPuzzleLetterRevealer) {
        self.letterRevealer = letterRevealer
    }

    public func revealAllLetters(in game: WordGame) -> (WordGame, revealedLetters: [WordPuzzleLetter]) {
        let (newPuzzle, revealedLetters) = letterRevealer.revealAllLetters(in: game.puzzle)
        let newLetterSolvingTimeSeconds = newPuzzle.puzzleLetters
            .map { _ in TimeInterval(0) }
        let newGame = game.copy(
            puzzle: newPuzzle,
            letterSolvingTimeSeconds: newLetterSolvingTimeSeconds
        )

        return (newGame, revealedLetters: revealedLetters)
    }
}
