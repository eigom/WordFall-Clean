//
//  Copyright 2023 Eigo Madaloja
//

import WordPuzzle
import WordGame
import Foundation

public struct WordGameImpl: WordGame {
    public let puzzle: WordPuzzle
    public let totalSolvingTimeSeconds: TimeInterval
    public let letterSolvingTimeSeconds: [TimeInterval]

    public func copy(puzzle: WordPuzzle, letterSolvingTimeSeconds: [TimeInterval]) -> WordGame {
        return WordGameImpl(
            puzzle: puzzle,
            totalSolvingTimeSeconds: totalSolvingTimeSeconds,
            letterSolvingTimeSeconds: letterSolvingTimeSeconds
        )
    }
}
