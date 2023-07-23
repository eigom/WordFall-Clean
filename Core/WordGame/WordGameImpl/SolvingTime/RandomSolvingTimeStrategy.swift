//
//  Copyright 2023 Eigo Madaloja
//

import WordGame
import Foundation

struct RandomSolvingTimeStrategy: SolvingTimeStrategy {
    let letterSolvingTimeSeconds: [TimeInterval]

    init(wordLength: Int) {
        let maxSeconds = TimeInterval(wordLength * 10)

        letterSolvingTimeSeconds = (0 ..< wordLength)
            .map { _ in maxSeconds * TimeInterval.random(in: 0.8...maxSeconds) }
    }
}
