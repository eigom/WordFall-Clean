//
//  Copyright 2023 Eigo Madaloja
//

import WordProvider

extension DBWord: Word {
    var definitions: [Definition] {
        dbDefinitions ?? []
    }
}
