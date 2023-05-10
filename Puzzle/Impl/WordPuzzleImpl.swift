public struct WordPuzzleImpl: WordPuzzle {
    public let wordLetters: [Character]
    public let puzzleLetters: [Character?]
    public let solutionLetters: [Character?]

    public func makeCopy(
        puzzleLetters: [Character?],
        solutionLetters: [Character?]
    ) -> WordPuzzle {
        return WordPuzzleImpl(
            wordLetters: wordLetters,
            puzzleLetters: puzzleLetters,
            solutionLetters: solutionLetters
        )
    }
}

/*public struct WordPuzzleImpl: WordPuzzle {
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

        guard
            let wordLetterIndex = wordLetters
                .enumerated()
                .first(where: {
                    $0.element == puzzleLetter && solutionLetters[$0.offset] == emptyLetter
                })?
                .offset
        else { return PuzzleUpdate(updatedPuzzle: self, update: .none) }

        let wordLetter = wordLetters[wordLetterIndex]
        let newSolutionLetters = solutionLetters.replacingElement(at: wordLetterIndex, with: wordLetter)

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
}*/
