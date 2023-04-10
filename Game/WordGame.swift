import Puzzle

public struct WordGameSetup {
    let puzzle: WordPuzzle
    let solver: WordPuzzleSolver
    let revealer: WordPuzzleRevealer
    let solvingTimeStrategy: SolvingTimeStrategy
}

public protocol WordGame {
    init(setup: WordGameSetup, onEvent: (WordGameEvent) -> Void)

    func play()
    func pause()
    //func resume()
    func solve()
    func tryLetter(at index: Int)
}

public struct PuzzleLetter {
    public let letter: Character
    public let solvingTime: TimeInterval
}

public enum WordGameEvent {
    case gameStart
    case gamePause
    case gameEnd
    case revealedLetter
    case solvedLetter
    case solvedPuzzle
}

/*
    LetterSolvingTimeStrategy
        - var solvingTime: TimeInterval

    WordLengthLetterSolvingTimeStrategy
        - init(wordLength) - calc based on length

 */
