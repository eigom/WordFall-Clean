import WordPuzzle

public protocol WordGameGameplayPresenter {
    typealias Finished = () -> Void

    func setupNewGame(
        puzzleLetters: [Character],
        letterSolvingTimeSeconds: [TimeInterval],
        totalSolvingTimeSeconds: TimeInterval,
        finished: Finished
    )

    func revealSolvedLetter(_ letter: WordPuzzleLetter)
    func revealLetters(_ letters: [WordPuzzleLetter])
}
