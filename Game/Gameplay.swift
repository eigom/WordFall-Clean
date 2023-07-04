import Puzzle

public protocol Gameplay {
    func applyElapsedSeconds(_ seconds: Float, to game: WordGame) -> (WordGame, WordGameDiff)
    func tryLetter(at puzzleLetterIndex: Int, in game: WordGame, using letterTrier: PuzzleLetterTrier) -> (WordGame, WordGameDiff)
    func solve(_ game: WordGame, using solver: PuzzleSolver, letterRevealer: PuzzleLetterRevealer) -> (WordGame, WordGameDiff)
}

public struct WordGameDiff {
    public let solvedLetters: [PuzzleLetter]
    public let revealedLetters: [PuzzleLetter]

    init(solvedLetters: [PuzzleLetter] = [], revealedLetters: [PuzzleLetter] = []) {
        self.solvedLetters = solvedLetters
        self.revealedLetters = revealedLetters
    }
}
