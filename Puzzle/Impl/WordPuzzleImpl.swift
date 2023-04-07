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
        guard word != partialSolution else { return (self, .solved) }

        let newPartialSolution = partialSolution + String(letter)

        guard word.hasPrefix(newPartialSolution) else { return (self, .none) }

        let newPuzzleLetters = puzzleLetters
            .firstIndex(of: letter)
            .map { puzzleLetters[..<$0] + puzzleLetters[($0+1)...] }
            .map { Array($0) } ?? puzzleLetters

        let newPuzzle = WordPuzzleImpl(
            word: word,
            partialSolutionWord: newPartialSolution,
            puzzleLetters: newPuzzleLetters
        )

        return (newPuzzle, .solvedLetter(letter, index: partialSolution.count))
    }

    public func solve() -> (WordPuzzle, [PuzzleUpdate]) {
        guard word != partialSolution else { return (self, [.solved]) }

        let remainingSolution = word.suffix(
            from: word.index(
                word.startIndex,
                offsetBy: partialSolution.count
            )
        )
        let indexes = partialSolution.count ..< word.count

        let updates: [PuzzleUpdate] = zip(remainingSolution, indexes)
            .map { .solvedLetter($0, index: $1) } + [.solved]

        let solvedPuzzle = WordPuzzleImpl(
            word: word,
            partialSolutionWord: word,
            puzzleLetters: []
        )

        return (solvedPuzzle, updates)
    }
}
