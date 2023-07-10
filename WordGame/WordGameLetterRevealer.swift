import WordPuzzle

public protocol WordGameLetterRevealer {
    func revealAllLetters(
        in game: WordGame,
        using letterRevealer: WordPuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [WordPuzzleLetter])
}
