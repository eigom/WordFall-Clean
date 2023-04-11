public protocol WordGameGameplayMaker {
    func make(with game: WordGame, onEvent: @escaping (WordGameEvent) -> Void) -> WordGameGameplay
}
