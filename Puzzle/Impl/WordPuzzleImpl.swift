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

    public func tryNextLetter(_ letter: Character) -> PuzzleUpdate {
        let newPartialSolution = partialSolution + String(letter)

        guard word.hasPrefix(newPartialSolution) else {
            return PuzzleUpdate(puzzle: self, update: .none)
        }

        let updatedPuzzle = WordPuzzleImpl(
            word: word,
            partialSolutionWord: newPartialSolution,
            puzzleLetters: puzzleLetters
        )

        let update: Update = .solvedLetter(
            letter,
            index: partialSolution.count,
            isPuzzleSolved: newPartialSolution == word
        )

        return PuzzleUpdate(puzzle: updatedPuzzle, update: update)
    }

    public func solve() -> [PuzzleUpdate] {
        let remainingSolution = word.suffix(word.count - partialSolution.count)
        
        let updates = remainingSolution.map {
            tryNextLetter($0)
        }

        return updates
    }
}
