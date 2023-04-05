public enum SQLiteError: Error {
    case unableToOpen(databasePath: String, errorMessage: String)
    case unableToClose(errorMessage: String)
    case unexpectedNilHandle

    case failedToPrepareQuery(String, errorMessage: String)
    case invalidStatementHandle

    case failedToGetColumnName
    case failedToEvaluateQuery(errorMessage: String)

    case unsupportedValueInResultSet

    case failedToConvertToData
    case failedToDecodeJSON(json: String, error: Error)
}
