import Puzzle

public struct GameMakerImpl: GameMaker {
    public func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame {
        return WordGameImpl(
            puzzle: puzzle,
            totalSolvingTimeSeconds: solvingTimeStrategy.totalSolvingTimeSeconds,
            letterSolvingTimeSeconds: solvingTimeStrategy.letterSolvingTimeSeconds
        )
    }
}
