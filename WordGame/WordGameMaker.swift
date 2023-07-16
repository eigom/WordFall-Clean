//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle

public protocol WordGameMaker {
    func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame
}
