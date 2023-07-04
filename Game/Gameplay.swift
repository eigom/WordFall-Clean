import Puzzle

public protocol Gameplay {
    func applyElapsedSeconds(
        _ elapsedSeconds: TimeInterval,
        to game: WordGame,
        letterRevealer: PuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [PuzzleLetter])

    func tryLetter(
        at puzzleLetterIndex: Int,
        in game: WordGame,
        using letterTrier: PuzzleLetterTrier
    ) -> (WordGame, solvedLetter: PuzzleLetter?)

    func solve(
        _ game: WordGame,
        using solver: PuzzleSolver,
        letterRevealer: PuzzleLetterRevealer
    ) -> (WordGame, revealedLetters: [PuzzleLetter])
}
