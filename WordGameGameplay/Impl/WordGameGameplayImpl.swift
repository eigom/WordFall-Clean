import WordGame

public class WordGameGameplayImpl: WordGameGameplay {
    private var wordGame: WordGame
    private let gamePresenter: WordGameGameplayPresenter
    private let letterTrier: WordGameLetterTrier

    init(
        wordGame: WordGame,
        gamePresenter: WordGameGameplayPresenter,
        letterTrier: WordGameLetterTrier
    ) {
        self.wordGame = wordGame
        self.gamePresenter = gamePresenter
        self.letterTrier = letterTrier
    }

    public func start() {
        gamePresenter.setupNewGame(
            puzzleLetters: wordGame.puzzle.puzzleLetters.compactMap { $0 },
            letterSolvingTimeSeconds: wordGame.letterSolvingTimeSeconds,
            totalSolvingTimeSeconds: wordGame.totalSolvingTimeSeconds,
            finished: {
                // start game loop
            }
        )
    }

    public func pause() {
        // pause game loop
    }

    public func resume() {
        // resume game loop
    }

    public func finish() {
        // stop game loop, end
    }

    public func tryLetter(at puzzleLetterIndex: Int) {
        let (newWordGame, solvedLetter) = letterTrier.tryLetter(at: puzzleLetterIndex, in: wordGame)

        wordGame = newWordGame

        if let solvedLetter {
            
        }
    }
}
