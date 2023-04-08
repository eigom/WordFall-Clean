import Puzzle

public protocol WordGame {
    init(puzzle: WordPuzzle, onEvent: (WordGameEvent) -> Void)

    func play()
    func pause()
    func solve()
    func tryLetter(at index: Int)
}

public struct WordGameLetter {
    public let letter: Character
    public let solvingTime: TimeInterval
}

public enum WordGameEvent {

}
