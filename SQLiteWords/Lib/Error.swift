enum Error: Swift.Error {
    case unableToOpen(dbPath: String, errorCode: Int32)
    case unableToClose(errorCode: Int32)
    case failedToPrepareQuery(String, errorCode: Int32)
    case failedToEvaluateQuery(String, errorCode: Int32)
}
