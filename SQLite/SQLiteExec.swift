//
//  Copyright 2023 Eigo Madaloja
//

import SQLite3

struct SQLiteExec {
    @discardableResult
    init(
        expect successCode: Int32,
        databaseHandle: OpaquePointer?,
        in statement: () -> Int32,
        orThrow error: (Int32, String) -> Error
    ) throws {
        let resultCode = statement()

        guard resultCode == successCode else {
            let errorMessage = String(cString: sqlite3_errmsg(databaseHandle))
            throw error(resultCode, errorMessage)
        }
    }
}
