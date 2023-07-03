public protocol PuzzleLetterTrier {
    func tryLetter(at puzzleIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, PuzzleLetter?)
}

