import WordPuzzle

public protocol WordGameElapsedTimeApplier {
    func applyElapsedSeconds(
        _ elapsedSeconds: TimeInterval,
        to game: WordGame,
        letterRevealer: WordPuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [WordPuzzleLetter])
}
