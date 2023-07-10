import WordPuzzle

public protocol WordGameLetterTrier {
    func tryLetter(
        at puzzleLetterIndex: Int,
        in game: WordGame,
        using letterTrier: WordPuzzleLetterTrier
    ) -> (WordGame, solvedLetter: WordPuzzleLetter?)
}
