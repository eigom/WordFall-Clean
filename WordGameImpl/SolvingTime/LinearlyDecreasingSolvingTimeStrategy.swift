//
//  Copyright 2023 Eigo Madaloja
//

import WordGame
import Foundation

struct LinearlyDecreasingSolvingTimeStrategy: SolvingTimeStrategy {
    let letterSolvingTimeSeconds: [TimeInterval]

    init(wordLength: Int) {
        let maxSeconds = TimeInterval(wordLength * 10)

        letterSolvingTimeSeconds = (0 ..< wordLength)
            .reduce(([TimeInterval](), maxSeconds), { partialResult, _ in
                let (solvingTimes, time) = partialResult
                return (solvingTimes + [time], time - 2)
            }).0
    }
}
