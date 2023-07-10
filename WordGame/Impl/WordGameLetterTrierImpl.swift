import WordPuzzle

public struct WordGameLetterTrierImpl: WordGameLetterTrier {
    public func tryLetter(
        at puzzleLetterIndex: Int,
        in game: WordGame,
        using letterTrier: WordPuzzleLetterTrier
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
