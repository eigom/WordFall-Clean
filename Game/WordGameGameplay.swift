import Puzzle

public protocol WordGameGameplay {
    init(
        game: WordGame,
        solver: WordPuzzleSolver,
        revealer: WordPuzzleRevealer,
        timer: Timer,
        onEvent: @escaping (WordGameEvent) -> Void
    )

    func play()
    func pause()
    func resume()
    func solve()
    func tryLetter(at puzzleIndex: Int)
}

public enum WordGameEvent {
    case gameStart
    case gamePause
    case gameEnd
    case revealedLetter(Character, puzzleIndex: Int, wordIndex: Int)
    case solvedLetter(Character, puzzleIndex: Int, wordIndex: Int)
    case solvedPuzzle(revealedLetters: [(Character, wordIndex: Int)])
}
