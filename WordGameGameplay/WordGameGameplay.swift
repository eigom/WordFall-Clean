public protocol WordGameGameplay {
    func start()
    func pause()
    func resume()
    func finish()
    func tryLetter(at puzzleLetterIndex: Int)
}
