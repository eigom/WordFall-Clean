import Puzzle

public protocol GameMaker {
    func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame
}
