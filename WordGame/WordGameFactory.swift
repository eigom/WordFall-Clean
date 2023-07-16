//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle

public protocol WordGameFactory {
    func makeGame(puzzle: WordPuzzle, solvingTimeStrategy: SolvingTimeStrategy) -> WordGame
}
