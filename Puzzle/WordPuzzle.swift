/*public protocol WordPuzzle {
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
}*/

public protocol WordPuzzle {
    var wordLetters: [Character] { get }
    var puzzleLetters: [Character] { get }
    var partialSolution: [Character?] { get }
}

public protocol WordPuzzleMaker {
    func makePuzzle(with word: String) -> WordPuzzle
}

public struct LetterTryingResult {
    public let wasCorrectLetter: Bool
    public let isPuzzleSolved: Bool
    public let resultingPuzzle: WordPuzzle
}

public protocol WordPuzzleSolver {
    func tryLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> LetterTryingResult
    //func solve(_ puzzle: WordPuzzle) -> WordPuzzle
}

public struct LetterRevealingResult {
    public let revealedLetter: Character
    public let resultingPuzzle: WordPuzzle
}

public protocol WordPuzzleRevealer {
    func revealLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> LetterRevealingResult
}
