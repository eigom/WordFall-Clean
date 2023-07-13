public protocol WordGameGameplay {
    func start()
    func pause()
    func resume()
    func tryLetter(at puzzleLetterIndex: Int)
    func finish()
}
