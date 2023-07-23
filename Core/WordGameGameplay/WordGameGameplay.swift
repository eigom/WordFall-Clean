//
//  Copyright 2023 Eigo Madaloja
//

public protocol WordGameGameplay {
    func start()
    func stop()
    func tryLetter(at puzzleLetterIndex: Int)
    func revealAllLetters()
}
