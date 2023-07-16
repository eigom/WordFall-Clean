//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle

public protocol WordGameElapsedTimeApplier {
    func applyElapsedSeconds(
        _ elapsedSeconds: TimeInterval,
        to game: WordGame
    ) -> (WordGame, revealedLetters: [WordPuzzleLetter])
}
