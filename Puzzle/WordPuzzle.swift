public protocol WordPuzzle {
    init(word: String)

    var remainingPuzzleLetters: [Character] { get }

    func tryNextLetter(_ letter: Character) -> (WordPuzzle, PuzzleUpdate)
    func solve() -> (WordPuzzle, [PuzzleUpdate])
}

public enum PuzzleUpdate {
    case none
    case solved
    case solvedLetter(Character, index: UInt)
}
