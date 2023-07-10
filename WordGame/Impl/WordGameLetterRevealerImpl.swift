import WordPuzzle

public struct WordGameLetterRevealerImpl: WordGameLetterRevealer {
    public func revealAllLetters(
        in game: WordGame,
        using letterRevealer: WordPuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [WordPuzzleLetter]) {
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
