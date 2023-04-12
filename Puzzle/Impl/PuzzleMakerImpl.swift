public struct PuzzleMakerImpl: PuzzleMaker {
    public func makePuzzle(with word: String) -> WordPuzzle {
        return WordPuzzleImpl(
            wordLetters: Array(word),
            puzzleLetters: word.shuffled(),
            solutionLetters: Array(repeating: nil, count: word.count)
        )
    }
}
