//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import Foundation

public protocol WordGame {
    var puzzle: WordPuzzle { get }
    var totalSolvingTimeSeconds: TimeInterval { get }
    var letterSolvingTimeSeconds: [TimeInterval] { get }

    func copy(
        puzzle: WordPuzzle,
        letterSolvingTimeSeconds: [TimeInterval]
    ) -> WordGame
}
