import Puzzle

public protocol WordGame {
    init(puzzle: WordPuzzle)

    func tryNextLetter(at index: Int) -> (WordGame, GameUpdate)
    func revealLetter(at index: Int) -> (WordGame, GameUpdate)
    func solvePuzzle() -> (WordGame, [GameUpdate])
}

public enum GameUpdate {
    case none
    case puzzleSolved
    case revealedLetter(Character, index: Int)
}
