public struct WordPuzzleImpl: WordPuzzle {
    public let puzzleLetters: [Character]

    private let word: String
    private let solutionLetters: [Character]
    private let emptyLetter = Character(" ")

    public init(word: String) {
        self.word = word
        puzzleLetters = word.shuffled()
        solutionLetters = Array(
            repeating: emptyLetter,
            count: word.count
        )
    }

    private init(word: String, puzzleLetters: [Character], solutionLetters: [Character]) {
        self.word = word
        self.puzzleLetters = puzzleLetters
        self.solutionLetters = solutionLetters
    }

    public func tryLetter(at index: Int) -> PuzzleUpdate {
        let puzzleLetter = puzzleLetters[index]
        let wordLetter = word.element(at: index)

        guard puzzleLetter == wordLetter else {
            return PuzzleUpdate(updatedPuzzle: self, update: .none)
        }

        let newSolutionLetters = solutionLetters.replacingElement(at: index, with: wordLetter)

        let updatedPuzzle = WordPuzzleImpl(
            word: word,
            puzzleLetters: puzzleLetters,
            solutionLetters: newSolutionLetters
        )

        let update: Update = .solvedLetter(
            wordLetter,
            index: index,
            isPuzzleSolved: String(newSolutionLetters) == word
        )

        return PuzzleUpdate(updatedPuzzle: updatedPuzzle, update: update)
    }

    public func revealLetter(at index: Int) -> PuzzleUpdate {
        let puzzleLetter = puzzleLetters[index]
        let wordLetter = word.element(at: index)
        let newSolutionLetters = solutionLetters.replacingElement(at: index, with: wordLetter)

        let updatedPuzzle = WordPuzzleImpl(
            word: word,
            puzzleLetters: puzzleLetters,
            solutionLetters: newSolutionLetters
        )

        let update: Update = .revealedLetter(
            wordLetter,
            index: index,
            isPuzzleSolved: String(newSolutionLetters) == word
        )

        return PuzzleUpdate(updatedPuzzle: updatedPuzzle, update: update)
    }

    public func solve() -> [PuzzleUpdate] {
        let remainingLetterIndexes = solutionLetters
            .enumerated()
            .filter { $0.element != emptyLetter }
            .map { $0.offset }
        
        let puzzleUpdates = remainingLetterIndexes.map {
            revealLetter(at: $0)
        }

        return puzzleUpdates
    }
}
