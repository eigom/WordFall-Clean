public protocol PuzzleLetterTrier {
    func tryLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, PuzzleLetter?)
}

