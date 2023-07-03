import Puzzle

public struct GameplayImpl: Gameplay {
    public func applyElapsedSeconds(_ seconds: Float, to game: WordGame) -> (WordGame, WordGameDiff) {

    }

    public func tryLetter(at puzzleLetterIndex: UInt, in game: WordGame, using letterTrier: PuzzleLetterTrier) -> (WordGame, WordGameDiff) {

    }

    public func solve(_ game: WordGame, using solver: PuzzleSolver) -> (WordGame, WordGameDiff) {
        let solveResult = solver.solve(game.puzzle)
        game = game.copy(puzzle: solveResult.resultingPuzzle)
        let revealedLetters: [(Character, wordIndex: Int)] = solveResult.revealedLetters
            .map { ($0.letter, $0.wordIndex) }
        eventListener(.solvedPuzzle(revealedLetters: revealedLetters))
        eventListener(.gameEnded)
    }
}

/*import Puzzle

public final class GameplayImpl: Gameplay {
    private var game: WordGame
    private let solver: PuzzleSolver
    private let revealer: PuzzleRevealer
    private let timer: Timer
    private let eventListener: (GameplayEvent) -> Void

    public init(
        game: WordGame,
        solver: PuzzleSolver,
        revealer: PuzzleRevealer,
        timer: Timer,
        onEvent: @escaping (GameplayEvent) -> Void
    ) {
        self.game = game
        self.solver = solver
        self.revealer = revealer
        self.timer = timer
        self.eventListener = onEvent
    }

    public func play() {
        timer.start(durationSeconds: game.totalSolvingTimeSeconds) { elapsedSeconds in
            revealExpiredLetters(elapsedSeconds: elapsedSeconds)
        } onFinished: {
            eventListener(.gameEnded)
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
        game = game.copy(puzzle: solveResult.resultingPuzzle)
        let revealedLetters: [(Character, wordIndex: Int)] = solveResult.revealedLetters
            .map { ($0.letter, $0.wordIndex) }
        eventListener(.solvedPuzzle(revealedLetters: revealedLetters))
        eventListener(.gameEnded)
    }

    public func tryLetter(at puzzleIndex: Int) {
        let tryResult = solver.tryLetter(at: puzzleIndex, in: game.puzzle)

        switch tryResult {
        case .wrongLetter:
            break
        case let .correctLetter(letter, wordIndex: wordIndex, resultingPuzzle: resultingPuzzle):
            game = game.copy(puzzle: resultingPuzzle)
            let event: GameplayEvent = .solvedLetter(
                letter,
                puzzleIndex: puzzleIndex,
                wordIndex: wordIndex
            )
            eventListener(event)

            if solver.isSolved(game.puzzle) {
                eventListener(.gameEnded)
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
                game = game.copy(puzzle: resultingPuzzle)
                let event: GameplayEvent = .revealedLetter(
                    letter,
                    puzzleIndex: index,
                    wordIndex: wordIndex
                )
                eventListener(event)

                if solver.isSolved(game.puzzle) {
                    eventListener(.gameEnded)
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
*/
