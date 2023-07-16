import WordGame

public struct SolvingTimeStrategyProviderImpl: SolvingTimeStrategyProvider {
    private let defaultStrategy: SolvingTimeStrategy
    private let allStrategies: [SolvingTimeStrategy]

    public init(defaultStrategy: SolvingTimeStrategy, otherStrategies: [SolvingTimeStrategy]) {
        self.defaultStrategy = defaultStrategy
        self.allStrategies = [defaultStrategy] + otherStrategies
    }

    public func randomStrategy() -> SolvingTimeStrategy {
        return allStrategies.randomElement() ?? defaultStrategy
    }
}
