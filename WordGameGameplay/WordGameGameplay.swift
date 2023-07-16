//
//  Copyright 2023 Eigo Madaloja
//

public protocol WordGameGameplay {
    func start()
    func tryLetter(at puzzleLetterIndex: Int)
    func revealAllLetters()
}
