struct SQLiteExec {
    @discardableResult
    init(
        expect successCode: Int32,
        statement: () -> Int32,
        orThrow error: (Int32) -> Error
    ) throws {
        let resultCode = statement()
        guard resultCode == successCode else { throw error(resultCode) }
    }
}
