//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import WordProvider
import WordGame
import Common

public struct WordGameFactoryImpl: WordGameFactory {
    private let wordPuzzleFactory: WordPuzzleFactory
    private let solvingTimeStrategyProvider: SolvingTimeStrategyProvider

    public init(wordPuzzleFactory: WordPuzzleFactory, solvingTimeStrategyProvider: SolvingTimeStrategyProvider) {
        self.wordPuzzleFactory = wordPuzzleFactory
        self.solvingTimeStrategyProvider = solvingTimeStrategyProvider
    }

    public func makeGame(wordLength: WordLength) -> Try<WordGame> {
        let wordPuzzle = wordPuzzleFactory.makePuzzle(wordLength: wordLength)

        return wordPuzzle.map { wordPuzzle in
            let solvingTimeStrategy = solvingTimeStrategyProvider.randomStrategy(
                wordLength: wordPuzzle.puzzleLetters.count
            )

            return WordGameImpl(
                puzzle: wordPuzzle,
                totalSolvingTimeSeconds: solvingTimeStrategy.totalSolvingTimeSeconds,
                letterSolvingTimeSeconds: solvingTimeStrategy.letterSolvingTimeSeconds
            )
        }
    }
}
