public enum WordGameAction {
    case tryLetter(index: Int)
    case solve
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

public protocol Gameplay {
    func applyElapsedSeconds(_ seconds: Float, to game: WordGame) -> (WordGame, WordGameDiff)
    func applyGameAction(_ action: WordGameAction, to game: WordGame) -> (WordGame, WordGameDiff)
}
