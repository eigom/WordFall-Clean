//
//  Copyright 2023 Eigo Madaloja
//

public protocol SolvingTimeStrategyProvider {
    func randomStrategy(wordLength: Int) -> SolvingTimeStrategy
}
