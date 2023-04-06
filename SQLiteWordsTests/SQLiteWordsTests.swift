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
        let wordProvider = try SQLiteWordProvider()
        let wordLength = UInt.random(in: 3 ..< 10)
        let word = try wordProvider.nextWord(length: .fixed(length: wordLength))
        XCTAssertEqual(UInt(word.word.count), wordLength)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
