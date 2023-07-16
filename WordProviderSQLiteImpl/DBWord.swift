//
//  Copyright 2023 Eigo Madaloja
//

struct DBWord: Decodable {
    let id: Int64
    let word: String
    let dbDefinitions: [DBDefinition]?
}
