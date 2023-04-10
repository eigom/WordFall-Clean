import Puzzle

public protocol WordGameGameplay {
    init(
        game: WordGame,
        solver: WordPuzzleSolver,
        revealer: WordPuzzleRevealer,
        timer: Timer,
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
    case revealedLetter(Letter)
    case solvedLetter(Letter)
    case solvedPuzzle(revealedLetter: [Letter])
}

public struct Letter {
    public let letter: Character
    public let wordLetterIndex: Int
    public let puzzleLetterIndex: Int
}
