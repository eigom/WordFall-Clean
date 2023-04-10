import Puzzle

public protocol WordGameGameplay {
    init(
        game: WordGame,
        solver: WordPuzzleSolver,
        revealer: WordPuzzleRevealer,
        onEvent: (WordGameEvent) -> Void
    )

    func play()
    func pause()
    func resume()
    func solve()
    func tryLetter(at index: Int)
}

public enum WordGameEvent {
    case gameStart
    case gamePause
    case gameEnd
    case revealedLetter(Character, wordIndex: Int)
    case solvedLetter
    case solvedPuzzle
}

/*public protocol WordGame {
    init(setup: WordGameSetup, onEvent: (WordGameEvent) -> Void)

    func play()
    func pause()
    //func resume()
    func solve()
    func tryLetter(at index: Int)
}

public struct WordGameSetup {
    let puzzle: WordPuzzle
    let solver: WordPuzzleSolver
    let revealer: WordPuzzleRevealer
    let solvingTimeStrategy: SolvingTimeStrategy
}

public struct PuzzleLetter {
    public let letter: Character
    public let solvingTime: TimeInterval
}

public enum WordGameEvent {
    case gameStart
    case gamePause
    case gameEnd
    case revealedLetter(Character, wordIndex: Int)
    case solvedLetter
    case solvedPuzzle
}*/
