public protocol WordGameGameplay {
    func start()
    func tryLetter(at puzzleLetterIndex: Int)
    func revealAllLetters()
}
