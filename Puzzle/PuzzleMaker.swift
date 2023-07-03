public protocol PuzzleMaker {
    static func makePuzzle(with word: String) -> WordPuzzle
}
