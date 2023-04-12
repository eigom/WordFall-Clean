import Puzzle

public struct GameplayMakerImpl: GameplayMaker {
    private let solver: PuzzleSolver
    private let revealer: PuzzleRevealer
    private let timer: Timer

    public init(
        solver: PuzzleSolver,
        revealer: PuzzleRevealer,
        timer: Timer
    ) {
        self.solver = solver
        self.revealer = revealer
        self.timer = timer
    }

    public func make(with game: WordGame, onEvent: @escaping (GameplayEvent) -> Void) -> Gameplay {
        return GameplayImpl(
            game: game,
            solver: solver,
            revealer: revealer,
            timer: timer,
            onEvent: onEvent
        )
    }
}
