public struct WordPuzzleMakerImpl: WordPuzzleMaker {
    public func makePuzzle(with word: String) -> WordPuzzle {
        return WordPuzzleImpl(
            wordLetters: Array(word),
            puzzleLetters: word.shuffled(),
            partialSolution: Array(repeating: nil, count: word.count)
        )
    }
}
