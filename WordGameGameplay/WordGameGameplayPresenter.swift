import WordPuzzle

public protocol WordGameGameplayPresenter {
    func setupNewGame(
        puzzleLetters: [Character],
        letterSolvingTimeSeconds: [TimeInterval],
        totalSolvingTimeSeconds: TimeInterval,
        finished: () -> Void
    )

    func revealSolvedLetter(_ letter: WordPuzzleLetter)
    func revealLetters(_ letters: [WordPuzzleLetter])
    func updateLetterSolvingTimeSeconds(_ seconds: [TimeInterval])
}
