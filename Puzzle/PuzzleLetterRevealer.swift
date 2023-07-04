public protocol PuzzleLetterRevealer {
    func revealLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, PuzzleLetter?)
    func revealLetters(at puzzleLetterIndexes: [Int], in puzzle: WordPuzzle) -> (WordPuzzle, [PuzzleLetter])
    func revealAllLetters(in puzzle: WordPuzzle) -> (WordPuzzle, [PuzzleLetter])
}
