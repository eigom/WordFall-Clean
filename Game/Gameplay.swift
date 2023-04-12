import Puzzle

public protocol Gameplay {
    init(
        game: WordGame,
        solver: PuzzleSolver,
        revealer: PuzzleRevealer,
        timer: Timer,
        onEvent: @escaping (GameplayEvent) -> Void
    )

    func play()
    func pause()
    func resume()
    func solve()
    func tryLetter(at puzzleIndex: Int)
}

public enum GameplayEvent {
    case gameStarted
    case gamePaused
    case gameEnded
    case revealedLetter(Character, puzzleIndex: Int, wordIndex: Int)
    case solvedLetter(Character, puzzleIndex: Int, wordIndex: Int)
    case solvedPuzzle(revealedLetters: [(Character, wordIndex: Int)])
}
