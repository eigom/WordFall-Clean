public protocol WordPuzzle {
    var wordLetters: [Character] { get }
    var puzzleLetters: [Character?] { get }
    var solutionLetters: [Character?] { get }

    func copy(
        puzzleLetters: [Character?],
        solutionLetters: [Character?]
    ) -> WordPuzzle
}
