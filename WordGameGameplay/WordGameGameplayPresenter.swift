//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import Foundation

public protocol WordGameGameplayPresenter {
    func setupGame(
        puzzleLetters: [Character],
        letterSolvingTimeSeconds: [TimeInterval],
        totalSolvingTimeSeconds: TimeInterval,
        finished: () -> Void
    )

    func revealSolvedLetter(_ letter: WordPuzzleLetter)
    func revealLetters(_ letters: [WordPuzzleLetter])
    func updateLetterSolvingTimeSeconds(_ seconds: [TimeInterval])
}
