import WordPuzzle

public protocol WordGameplay {
    func applyElapsedSeconds(
        _ elapsedSeconds: TimeInterval,
        to game: WordGame,
        letterRevealer: WordPuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [WordPuzzleLetter])

    func tryLetter(
        at puzzleLetterIndex: Int,
        in game: WordGame,
        using letterTrier: WordPuzzleLetterTrier
    ) -> (WordGame, solvedLetter: WordPuzzleLetter?)

    func revealAllLetters(
        in game: WordGame,
        using letterRevealer: WordPuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [WordPuzzleLetter])
}
