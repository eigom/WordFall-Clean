public struct WordPuzzleImpl: WordPuzzle {
    public let puzzleLetters: [Character]

    private let word: String
    private let partialSolution: String

    public init(word: String) {
        self.word = word
        partialSolution = ""
        puzzleLetters = word.shuffled()
    }

    private init(word: String, partialSolutionWord: String, puzzleLetters: [Character]) {
        self.word = word
        self.partialSolution = partialSolutionWord
        self.puzzleLetters = puzzleLetters
    }

    public func tryNextLetter(_ letter: Character) -> (WordPuzzle, PuzzleUpdate) {
        let newPartialSolution = partialSolution + String(letter)

        guard word.hasPrefix(newPartialSolution) else { return (self, .none) }

        let updatedPuzzle = WordPuzzleImpl(
            word: word,
            partialSolutionWord: newPartialSolution,
            puzzleLetters: puzzleLetters
        )

        let puzzleUpdate: PuzzleUpdate = .solvedLetter(
            letter,
            index: partialSolution.count,
            isPuzzleSolved: newPartialSolution == word
        )

        return (updatedPuzzle, puzzleUpdate)
    }

    public func solve() -> (WordPuzzle, [PuzzleUpdate]) {
        let puzzleUpdates: [PuzzleUpdate] = word
            .enumerated()
            .filter { letter in
                letter.offset >= partialSolution.count
            }
            .map { letter in
                .solvedLetter(
                    letter.element,
                    index: letter.offset,
                    isPuzzleSolved: letter.offset == word.count - 1
                )
            }

        let solvedPuzzle = WordPuzzleImpl(
            word: word,
            partialSolutionWord: word,
            puzzleLetters: puzzleLetters
        )

        return (solvedPuzzle, puzzleUpdates)
    }
}
