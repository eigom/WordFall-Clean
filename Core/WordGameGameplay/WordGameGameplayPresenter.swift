//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import WordGame
import Foundation

public protocol WordGameGameplayPresenter {
    func setupGame(_ wordGame: WordGame, finished: () -> Void)
    func revealSolvedLetter(_ letter: WordPuzzleLetter)
    func revealLetters(_ letters: [WordPuzzleLetter])
    func updateLetterSolvingTimeSeconds(_ seconds: [TimeInterval])
}
