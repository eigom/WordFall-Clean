//
//  Copyright 2023 Eigo Madaloja
//

public protocol WordPuzzleLetterTrier {
    func tryLetter(at puzzleLetterIndex: Int, in puzzle: WordPuzzle) -> (WordPuzzle, WordPuzzleLetter?)
}
