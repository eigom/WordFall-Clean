import WordProvider

extension DBWord: Word {
    var definitions: [Definition] {
        dbDefinitions ?? []
    }
}
