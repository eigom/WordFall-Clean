import Puzzle

public struct WordGameImpl: WordGame {
    private var puzzle: WordPuzzle
    private let puzzleLetters: [Character]

    public init(puzzle: WordPuzzle) {
        self.puzzle = puzzle
        puzzleLetters = puzzle.puzzleLetters
    }

    public func tryNextLetter(at index: Int) -> GameUpdate {
        let letter = puzzleLetters[index]
        let (updatedPuzzle, update) = puzzle.tryNextLetter(letter)

        guard update != .none else { return .none }

        puzzle = updatedPuzzle

        switch update {
        case .none:
            return .none
        case .solved:
            return .wordSolved
        case let .solvedLetter(letter, index: index):
            return
        }
    }

    public func revealLetter(at index: Int) -> GameUpdate {
        <#code#>
    }

    public func solvePuzzle() -> [GameUpdate] {
        <#code#>
    }
}
