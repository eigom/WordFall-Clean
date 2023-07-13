import WordGame

public class WordGameGameplayImpl: WordGameGameplay {
    private let wordGame: WordGame
    private let gamePresenter: WordGameGameplayPresenter

    init(wordGame: WordGame, gamePresenter: WordGameGameplayPresenter) {
        self.wordGame = wordGame
        self.gamePresenter = gamePresenter
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

    }

    public func resume() {

    }

    public func tryLetter(at puzzleLetterIndex: Int) {

    }

    public func finish() {

    }
}
