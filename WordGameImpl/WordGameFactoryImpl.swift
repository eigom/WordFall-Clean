//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import WordGame

public struct WordGameFactoryImpl: WordGameFactory {
    public func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame {
        return WordGameImpl(
            puzzle: puzzle,
            totalSolvingTimeSeconds: solvingTimeStrategy.totalSolvingTimeSeconds,
            letterSolvingTimeSeconds: solvingTimeStrategy.letterSolvingTimeSeconds
        )
    }
}
