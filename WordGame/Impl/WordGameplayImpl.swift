import WordPuzzle

public struct WordGameplayImpl: WordGameplay {
    public func applyElapsedSeconds(
        _ elapsedSeconds: TimeInterval,
        to game: WordGame,
        letterRevealer: WordPuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [WordPuzzleLetter]) {
        let newLetterSolvingTimeSeconds = game.letterSolvingTimeSeconds
            .map { max($0 - elapsedSeconds, 0) }
        let expiredLetterIndexes = newLetterSolvingTimeSeconds
            .enumerated()
            .filter { $0.element == 0 }
            .map { $0.offset }
        let (newPuzzle, revealedLetters) = letterRevealer.revealLetters(at: expiredLetterIndexes, in: game.puzzle)
        let newGame = game.copy(
            puzzle: newPuzzle,
            letterSolvingTimeSeconds: newLetterSolvingTimeSeconds
        )

        return (newGame, revealedLetters: revealedLetters)
    }

    public func tryLetter(
        at puzzleLetterIndex: Int,
        in game: WordGame,
        using letterTrier: WordPuzzleLetterTrier
    ) -> (WordGame, solvedLetter: WordPuzzleLetter?) {
        let (newPuzzle, solvedLetter) = letterTrier.tryLetter(at: puzzleLetterIndex, in: game.puzzle)
        let newLetterSolvingTimeSeconds = newPuzzle.puzzleLetters
            .enumerated()
            .map {
                $0.offset == solvedLetter?.puzzleIndex
                    ? TimeInterval(0)
                    : game.letterSolvingTimeSeconds[$0.offset]
            }
        let newGame = game.copy(
            puzzle: newPuzzle,
            letterSolvingTimeSeconds: newLetterSolvingTimeSeconds
        )

        return (newGame, solvedLetter: solvedLetter)
    }

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