import Puzzle

public final class WordGameGameplayImpl: WordGameGameplay {
    private var game: WordGame
    private let solver: WordPuzzleSolver
    private let revealer: WordPuzzleRevealer
    private let timer: Timer
    private let onEvent: (WordGameEvent) -> Void

    public init(
        game: WordGame,
        solver: WordPuzzleSolver,
        revealer: WordPuzzleRevealer,
        timer: Timer,
        onEvent: @escaping (WordGameEvent) -> Void
    ) {
        self.game = game
        self.solver = solver
        self.revealer = revealer
        self.timer = timer
        self.onEvent = onEvent
    }

    public func play() {
        timer.start(durationSeconds: game.totalSolvingTimeSeconds) { elapsedSeconds in
            revealExpiredLetters(elapsedSeconds: elapsedSeconds)
        } onFinished: {
            onEvent(.gameEnded)
        }
    }

    public func pause() {
        timer.pause()
    }

    public func resume() {
        timer.resume()
    }

    public func solve() {
        let solveResult = solver.solve(game.puzzle)
        game = game.makeCopy(newPuzzle: solveResult.resultingPuzzle)
        let revealedLetters: [(Character, wordIndex: Int)] = solveResult.revealedLetters
            .map { ($0.letter, $0.wordIndex) }
        onEvent(.solvedPuzzle(revealedLetters: revealedLetters))
        onEvent(.gameEnded)
    }

    public func tryLetter(at puzzleIndex: Int) {
        let tryResult = solver.tryLetter(at: puzzleIndex, in: game.puzzle)

        switch tryResult {
        case .wrongLetter:
            break
        case let .correctLetter(letter, wordIndex: wordIndex, resultingPuzzle: resultingPuzzle):
            game = game.makeCopy(newPuzzle: resultingPuzzle)
            let event: WordGameEvent = .solvedLetter(
                letter,
                puzzleIndex: puzzleIndex,
                wordIndex: wordIndex
            )
            onEvent(event)

            if solver.isSolved(game.puzzle) {
                onEvent(.gameEnded)
            }
        }
    }

    private func revealExpiredLetters(elapsedSeconds: TimeInterval) {
        let revealPuzzleLetterIndexes = expiredPuzzleLetterIndexes(elapsedSeconds: elapsedSeconds)
        revealPuzzleLetterIndexes.forEach { index in
            let revealResult = revealer.revealLetter(at: index, in: game.puzzle)

            switch revealResult {
            case .none:
                break
            case let .revealedLetter(letter, wordIndex: wordIndex, resultingPuzzle: resultingPuzzle):
                game = game.makeCopy(newPuzzle: resultingPuzzle)
                let event: WordGameEvent = .revealedLetter(
                    letter,
                    puzzleIndex: index,
                    wordIndex: wordIndex
                )
                onEvent(event)

                if solver.isSolved(game.puzzle) {
                    onEvent(.gameEnded)
                }
            }
        }
    }

    private func expiredPuzzleLetterIndexes(elapsedSeconds: TimeInterval) -> [Int] {
        return game.puzzle.puzzleLetters
            .enumerated()
            .compactMap { indexedLetter in
                guard indexedLetter.element != nil else { return nil }
                let solvingTimeSeconds = game.letterSolvingTimeSeconds[indexedLetter.offset]
                return solvingTimeSeconds < elapsedSeconds ? nil : indexedLetter.offset
            }
    }
}
