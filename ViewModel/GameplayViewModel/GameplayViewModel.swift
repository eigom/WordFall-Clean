public protocol GameplayViewModel: ObservableObject {
    var isRevealWordButtonHidden: Bool { get }

    func puzzleLetterTapped(at puzzleLetterIndex: Int)
    func nextPuzzleTapped()
    func revealWordTapped()
    func settingsTapped()
}
