import Puzzle

public struct WordGameImpl: WordGame {
    private var puzzle: WordPuzzle
    private let puzzleLetters: [Character]

    public init(puzzle: WordPuzzle) {
        self.puzzle = puzzle
        puzzleLetters = puzzle.puzzleLetters
    }

    private init(puzzle: WordPuzzle, puzzleLetters: [Character]) {
        self.puzzle = puzzle
        self.puzzleLetters = puzzleLetters
    }

    public func tryNextLetter(at index: Int) -> (WordGame, GameUpdate) {
        let letter = puzzleLetters[index]
        let (updatedPuzzle, puzzleUpdate) = puzzle.tryNextLetter(letter)

        switch puzzleUpdate {
        case .none:
            return (self, .none)
        case .solved:
            let newGame = WordGameImpl(
                puzzle: updatedPuzzle,
                puzzleLetters: puzzleLetters
            )
            return (newGame, .puzzleSolved)
        case let .solvedLetter(letter, index: index):
            return
        }
    }

    public func revealLetter(at index: Int) -> (WordGame, GameUpdate) {
        <#code#>
    }

    public func solvePuzzle() -> (WordGame, [GameUpdate]) {
        <#code#>
    }
}
