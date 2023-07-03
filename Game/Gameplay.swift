public protocol Gameplay {
    static func applyElapsedSeconds(_ seconds: Float, to game: WordGame) -> (WordGame, WordGameDiff)
    static func applyGameAction(_ action: WordGameAction, to game: WordGame) -> (WordGame, WordGameDiff)
}

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
