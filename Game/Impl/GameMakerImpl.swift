import Puzzle

public enum GameMakerImpl: GameMaker {
    public static func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame {
        return WordGameImpl(
            puzzle: puzzle,
            totalSolvingTimeSeconds: solvingTimeStrategy.totalSolvingTimeSeconds,
            letterSolvingTimeSeconds: solvingTimeStrategy.letterSolvingTimeSeconds
        )
    }
}
