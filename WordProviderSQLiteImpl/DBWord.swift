struct DBWord: Decodable {
    let id: Int64
    let word: String
    let dbDefinitions: [DBDefinition]?
}
