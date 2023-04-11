import Puzzle

public struct WordGameGameplayMakerImpl: WordGameGameplayMaker {
    private let solver: WordPuzzleSolver
    private let revealer: WordPuzzleRevealer
    private let timer: Timer

    public init(
        solver: WordPuzzleSolver,
        revealer: WordPuzzleRevealer,
        timer: Timer
    ) {
        self.solver = solver
        self.revealer = revealer
        self.timer = timer
    }

    public func make(with game: WordGame, onEvent: @escaping (WordGameEvent) -> Void) -> WordGameGameplay {
        return WordGameGameplayImpl(
            game: game,
            solver: solver,
            revealer: revealer,
            timer: timer,
            onEvent: onEvent
        )
    }
}
