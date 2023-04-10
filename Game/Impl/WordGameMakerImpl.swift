import Puzzle

public struct WordGameMakerImpl: WordGameMaker {
    public func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame {
        return WordGameImpl(
            puzzle: puzzle,
            totalSolvingTime: solvingTimeStrategy.totalSolvingTime,
            letterSolvingTimes: solvingTimeStrategy.letterSolvingTimes
        )
    }
}
