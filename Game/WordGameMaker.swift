import Puzzle

public protocol WordGameMaker {
    func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame
}
