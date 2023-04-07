public struct WordPuzzleImpl: WordPuzzle {
    public let puzzleLetters: [Character]

    private let word: String
    private let partialSolutionWord: String

    public init(word: String) {
        self.word = word
        partialSolutionWord = ""
        puzzleLetters = word.shuffled()
    }

    private init(word: String, partialSolutionWord: String, puzzleLetters: [Character]) {
        self.word = word
        self.partialSolutionWord = partialSolutionWord
        self.puzzleLetters = puzzleLetters
    }

    public func tryNextLetter(_ letter: Character) -> (WordPuzzle, PuzzleUpdate) {
        guard word != partialSolutionWord else { return (self, .solved) }

        let newPartialSolutionWord = partialSolutionWord + String(letter)

        guard word.hasPrefix(newPartialSolutionWord) else { return (self, .none) }

        let newPuzzleLetters = puzzleLetters
            .firstIndex(of: letter)
            .map { puzzleLetters[..<$0] + puzzleLetters[($0+1)...] }
            .map { Array($0) } ?? puzzleLetters

        let newWordPuzzle = WordPuzzleImpl(
            word: word,
            partialSolutionWord: newPartialSolutionWord,
            puzzleLetters: newPuzzleLetters
        )

        return (newWordPuzzle, .solvedLetter(letter, index: UInt(partialSolutionWord.count)))
    }

    public func solve() -> (WordPuzzle, [PuzzleUpdate]) {
        <#code#>
    }
}
