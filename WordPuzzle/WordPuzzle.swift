public protocol WordPuzzle {
    var wordLetters: [Character] { get }
    var puzzleLetters: [Character?] { get }
    var solutionLetters: [Character?] { get }
    var isSolved: Bool { get }

    func copy(puzzleLetters: [Character?], solutionLetters: [Character?]) -> WordPuzzle
}
