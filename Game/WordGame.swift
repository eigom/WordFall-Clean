import Puzzle

public protocol WordGame {
    init(puzzle: WordPuzzle)

    func tryNextLetter(at index: Int) -> GameUpdate
    func revealLetter(at index: Int) -> GameUpdate
    func solvePuzzle() -> [GameUpdate]
}

public enum GameUpdate {
    case none
    case revealedLetter(Character, index: Int)
    case wordSolved
}
