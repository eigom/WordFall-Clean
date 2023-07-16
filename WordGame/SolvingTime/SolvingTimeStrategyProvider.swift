//
//  Copyright 2023 Eigo Madaloja
//

public protocol SolvingTimeStrategyProvider {
    func randomStrategy(for wordLength: Int) -> SolvingTimeStrategy
}
