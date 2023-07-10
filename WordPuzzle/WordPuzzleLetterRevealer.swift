public protocol WordPuzzleLetterRevealer {
    func revealLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, WordPuzzleLetter?)
    func revealLetters(at puzzleLetterIndexes: [Int], in puzzle: WordPuzzle) -> (WordPuzzle, [WordPuzzleLetter])
    func revealAllLetters(in puzzle: WordPuzzle) -> (WordPuzzle, [WordPuzzleLetter])
}
