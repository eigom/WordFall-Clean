public struct WordPuzzleImpl: WordPuzzle {
    public let puzzleLetters: [Character]

    private let wordLetters: [Character]
    private let solutionLetters: [Character]
    private let emptyLetter = Character(" ")

    public init(word: String) {
        self.wordLetters = Array(word)
        puzzleLetters = word.shuffled()
        solutionLetters = Array(
            repeating: emptyLetter,
            count: word.count
        )
    }

    private init(wordLetters: [Character], puzzleLetters: [Character], solutionLetters: [Character]) {
        self.wordLetters = wordLetters
        self.puzzleLetters = puzzleLetters
        self.solutionLetters = solutionLetters
    }

    public func tryLetter(at index: Int) -> PuzzleUpdate {
        let puzzleLetter = puzzleLetters[index]
        let wordLetter = wordLetters[index]

        guard puzzleLetter == wordLetter else {
            return PuzzleUpdate(updatedPuzzle: self, update: .none)
        }

        let newSolutionLetters = solutionLetters.replacingElement(at: index, with: wordLetter)

        let updatedPuzzle = WordPuzzleImpl(
            wordLetters: wordLetters,
            puzzleLetters: puzzleLetters,
            solutionLetters: newSolutionLetters
        )

        let update: Update = .solvedLetter(
            wordLetter,
            index: index,
            isPuzzleSolved: newSolutionLetters == wordLetters
        )

        return PuzzleUpdate(updatedPuzzle: updatedPuzzle, update: update)
    }

    public func revealLetter(at index: Int) -> PuzzleUpdate {
        let puzzleLetter = puzzleLetters[index]
        let wordLetter = wordLetters[index]
        let newSolutionLetters = solutionLetters.replacingElement(at: index, with: wordLetter)

        let updatedPuzzle = WordPuzzleImpl(
            wordLetters: wordLetters,
            puzzleLetters: puzzleLetters,
            solutionLetters: newSolutionLetters
        )

        let update: Update = .revealedLetter(
            wordLetter,
            index: index,
            isPuzzleSolved: newSolutionLetters == wordLetters
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
