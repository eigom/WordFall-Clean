//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle

public protocol WordGameLetterTrier {
    func tryLetter(
        at puzzleLetterIndex: Int,
        in game: WordGame
    ) -> (WordGame, solvedLetter: WordPuzzleLetter?)
}
