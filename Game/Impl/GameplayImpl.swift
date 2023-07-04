import Puzzle

public struct GameplayImpl: Gameplay {
    public func applyElapsedSeconds(
        _ elapsedSeconds: TimeInterval,
        to game: WordGame,
        letterRevealer: PuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [PuzzleLetter]) {
        let newLetterSolvingTimeSeconds = game.letterSolvingTimeSeconds
            .map { max($0 - elapsedSeconds, 0) }
        let expiredLetterIndexes = newLetterSolvingTimeSeconds
            .enumerated()
            .filter { $0.element == 0 }
            .map { $0.offset }
        let (newPuzzle, revealedLetters) = letterRevealer.revealLetters(at: expiredLetterIndexes, in: game.puzzle)
        let newGame = game.copy(puzzle: newPuzzle, letterSolvingTimeSeconds: newLetterSolvingTimeSeconds)

        return (newGame, revealedLetters: revealedLetters)
    }

    public func tryLetter(
        at puzzleLetterIndex: Int,
        in game: WordGame,
        using letterTrier: PuzzleLetterTrier
    ) -> (WordGame, solvedLetter: PuzzleLetter?) {
        let (newPuzzle, solvedLetter) = letterTrier.tryLetter(at: puzzleLetterIndex, in: game.puzzle)
        let newGame = game.copy(puzzle: newPuzzle)

        return (newGame, solvedLetter: solvedLetter)
    }

    public func solve(
        _ game: WordGame,
        using solver: PuzzleSolver,
        letterRevealer: PuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [PuzzleLetter]) {
        let (newPuzzle, revealedLetters) = solver.solve(game.puzzle, using: letterRevealer)
        let newGame = game.copy(puzzle: newPuzzle)

        return (newGame, revealedLetters: revealedLetters)
    }
}
