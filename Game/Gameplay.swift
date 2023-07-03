import Puzzle

public protocol Gameplay {
    func applyElapsedSeconds(_ seconds: Float, to game: WordGame) -> (WordGame, WordGameDiff)
    func tryLetter(at puzzleLetterIndex: UInt, in game: WordGame, using letterTrier: PuzzleLetterTrier) -> (WordGame, WordGameDiff)
    func solve(_ game: WordGame, using solver: PuzzleSolver) -> (WordGame, WordGameDiff)
}

public struct WordGameDiff {
    public struct Letter {
        public let puzzleIndex: UInt
        public let solutionIndex: UInt
        public let character: Character
    }

    public let solvedLetters: [Letter]
    public let revealedLetters: [Letter]
}
