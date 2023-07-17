//
//  Copyright 2023 Eigo Madaloja
//

import Foundation

public protocol SolvingTimeStrategy {
    init(wordLength: Int)

    var totalSolvingTimeSeconds: TimeInterval { get }
    var letterSolvingTimeSeconds: [TimeInterval] { get }
}

public extension SolvingTimeStrategy {
    var totalSolvingTimeSeconds: TimeInterval {
        letterSolvingTimeSeconds.max() ?? 0
    }
}
