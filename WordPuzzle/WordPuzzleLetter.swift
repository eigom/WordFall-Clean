//
//  Copyright 2023 Eigo Madaloja
//

public protocol WordPuzzleLetter {
    var letter: Character { get }
    var puzzleIndex: Int { get }
    var solutionIndex: Int { get }
}
