//
//  SQLiteWordsTests.swift
//  SQLiteWordsTests
//
//  Created by Eigo Madaloja on 31.03.2023.
//

import XCTest
@testable import SQLiteWords
import SQLite

enum Error: Swift.Error {
    case databaseNotFound
}

struct TestWord: Decodable {
    let word: String
}

final class SQLiteWordsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let bundle = Bundle(for: SQLiteWordProvider.self)
        guard let dbPath = bundle.path(forResource: "words", ofType: "sqlite") else { throw Error.databaseNotFound }
        let connection = try Connection(databasePath: dbPath)
        let session = Session(connection: connection)
        let words: [TestWord] = try session.fetch(
            "SELECT word FROM Word WHERE id = :wordID",
            parameters: [
                .integer(1, name: "wordID")
            ],
            resultTypes: [
                .text
            ]
        )
        print(words)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
