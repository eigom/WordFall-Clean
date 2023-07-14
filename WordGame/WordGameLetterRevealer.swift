import WordPuzzle

public protocol WordGameLetterRevealer {
    func revealAllLetters(in game: WordGame) -> (WordGame, revealedLetters: [WordPuzzleLetter])
}
