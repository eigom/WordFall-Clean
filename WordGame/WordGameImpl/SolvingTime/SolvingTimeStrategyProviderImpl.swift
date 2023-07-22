//
//  Copyright 2023 Eigo Madaloja
//

import WordGame

public struct SolvingTimeStrategyProviderImpl: SolvingTimeStrategyProvider {
    private let defaultStrategy: SolvingTimeStrategy.Type
    private let allStrategies: [SolvingTimeStrategy.Type]

    public init(defaultStrategy: SolvingTimeStrategy.Type, otherStrategies: [SolvingTimeStrategy.Type]) {
        self.defaultStrategy = defaultStrategy
        self.allStrategies = [defaultStrategy] + otherStrategies
    }

    public func randomStrategy(wordLength: Int) -> SolvingTimeStrategy {
        let randomStrategy = allStrategies.randomElement()
            .map { $0.init(wordLength: wordLength) }

        return randomStrategy ?? defaultStrategy.init(wordLength: wordLength)
    }
}
