import Puzzle

public final class WordGameGameplayImpl: WordGameGameplay {
    private var game: WordGame
    private let solver: WordPuzzleSolver
    private let revealer: WordPuzzleRevealer
    private let timer: Timer
    private let onEvent: (WordGameEvent) -> Void

    public init(
        game: WordGame,
        solver: WordPuzzleSolver,
        revealer: WordPuzzleRevealer,
        timer: Timer,
        onEvent: @escaping (WordGameEvent) -> Void
    ) {
        self.game = game
        self.solver = solver
        self.revealer = revealer
        self.timer = timer
        self.onEvent = onEvent
    }

    public func play() {
        timer.start(durationSeconds: game.totalSolvingTimeSeconds) { elapsedSeconds in

        }
    }

    public func pause() {
        timer.pause()
    }

    public func resume() {
        timer.resume()
    }

    public func solve() {
        <#code#>
    }

    public func tryLetter(at index: Int) {
        let tryResult = solver.tryLetter(at: index, in: game.puzzle)

        switch tryResult {
        case .wrongLetter:
            break
        case let .correctLetter(letter, wordIndex: wordIndex, resultingPuzzle: resultingPuzzle):
            game = game.makeCopy(updatingPuzzle: resultingPuzzle)
        }
    }
}
