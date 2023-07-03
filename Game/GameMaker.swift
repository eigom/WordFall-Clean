import Puzzle

public protocol GameMaker {
    static func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame
}
