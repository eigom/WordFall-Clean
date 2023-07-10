public struct WordPuzzle {
    public let wordLetters: [Character]
    public let puzzleLetters: [Character?]
    public let solutionLetters: [Character?]
    public var isSolved: Bool { wordLetters == solutionLetters }
}
