public protocol WordPuzzle {
    init(word: String)

    var puzzleLetters: [Character] { get }

    func tryLetter(at index: Int) -> PuzzleUpdate
    func revealLetter(at index: Int) -> PuzzleUpdate
    func solve() -> [PuzzleUpdate]
}

public struct PuzzleUpdate {
    public let updatedPuzzle: WordPuzzle
    public let update: Update
}

public enum Update {
    case none
    case solvedLetter(Character, index: Int, isPuzzleSolved: Bool)
    case revealedLetter(Character, index: Int, isPuzzleSolved: Bool)
}
