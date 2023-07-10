public protocol WordPuzzleLetterTrier {
    func tryLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, WordPuzzleLetter?)
}
