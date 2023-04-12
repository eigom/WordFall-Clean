public protocol GameplayMaker {
    func make(with game: WordGame, onEvent: @escaping (GameplayEvent) -> Void) -> Gameplay
}
