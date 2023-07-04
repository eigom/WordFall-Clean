import Puzzle

public struct GameplayImpl: Gameplay {
    public func applyElapsedSeconds(_ elapsedSeconds: TimeInterval, to game: WordGame, letterRevealer: PuzzleLetterRevealer) -> (WordGame, WordGameDiff) {
        let newLetterSolvingTimeSeconds = game.letterSolvingTimeSeconds
            .map { max($0 - elapsedSeconds, 0) }
        let revealedLetters = newLetterSolvingTimeSeconds
            .enumerated()
            .map {  }

        // reveal letters where letterSolvingTimeSeconds == 0
    }

    public func tryLetter(at puzzleLetterIndex: Int, in game: WordGame, using letterTrier: PuzzleLetterTrier) -> (WordGame, WordGameDiff) {
        let (newPuzzle, solvedLetter) = letterTrier.tryLetter(at: puzzleLetterIndex, in: game.puzzle)
        let gameDiff = WordGameDiff(solvedLetters: [solvedLetter].compactMap { $0 })
        let newGame = game.copy(puzzle: newPuzzle)

        return (newGame, gameDiff)
    }

    public func solve(_ game: WordGame, using solver: PuzzleSolver, letterRevealer: PuzzleLetterRevealer) -> (WordGame, WordGameDiff) {
        let (newPuzzle, revealedLetters) = solver.solve(game.puzzle, using: letterRevealer)
        let gameDiff = WordGameDiff(revealedLetters: revealedLetters)
        let newGame = game.copy(puzzle: newPuzzle)

        return (newGame, gameDiff)
    }
}
