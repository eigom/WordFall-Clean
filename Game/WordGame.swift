import Puzzle

public protocol WordGame {
    init(puzzle: WordPuzzle)

    var puzzleLetters: [Character] { get }

    func tryNextLetter(at index: Int) -> GameUpdate
    func revealLetter(at index: Int) -> GameUpdate
    func solvePuzzle() -> [GameUpdate]
}

public struct GameUpdate {
    public let updatedGame: WordGame
    public let update: Update
}

public enum Update {
    case none
    case revealedLetter(Character, index: Int, isGameFinished: Bool)
}
