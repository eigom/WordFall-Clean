import WordPuzzle
import WordGame

public struct WordGameLetterTrierImpl: WordGameLetterTrier {
    private let letterTrier: WordPuzzleLetterTrier

    public init(letterTrier: WordPuzzleLetterTrier) {
        self.letterTrier = letterTrier
    }

    public func tryLetter(
        at puzzleLetterIndex: Int,
        in game: WordGame
    ) -> (WordGame, solvedLetter: WordPuzzleLetter?) {
        let (newPuzzle, solvedLetter) = letterTrier.tryLetter(at: puzzleLetterIndex, in: game.puzzle)
        let newLetterSolvingTimeSeconds = newPuzzle.puzzleLetters
            .enumerated()
            .map {
                $0.offset == solvedLetter?.puzzleIndex
                    ? TimeInterval(0)
                    : game.letterSolvingTimeSeconds[$0.offset]
            }
        let newGame = game.copy(
            puzzle: newPuzzle,
            letterSolvingTimeSeconds: newLetterSolvingTimeSeconds
        )

        return (newGame, solvedLetter: solvedLetter)
    }
}
