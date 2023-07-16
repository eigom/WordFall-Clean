import WordPuzzle

public struct WordPuzzleLetterImpl: WordPuzzleLetter {
    public let letter: Character
    public let puzzleIndex: Int
    public let solutionIndex: Int
}
