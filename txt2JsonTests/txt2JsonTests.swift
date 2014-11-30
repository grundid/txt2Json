//
//  txt2JsonTests.swift
//  txt2JsonTests
//
//  Created by Adrian Stabiszewski on 30.11.14.
//  Copyright (c) 2014 GrundID GmbH. All rights reserved.
//

import XCTest
import txt2Json

class txt2JsonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func findFileInResources(fileName:String, ofType:String) -> String? {
        let bundles =  NSBundle.allBundles()
        for bundle in bundles {
            var filePath = bundle.pathForResource(fileName, ofType:ofType)
            if (filePath != nil) {
                return filePath!
            }
        }
        return nil
    }
    
    func testProcessLines() {
        let mapping = ["name", "nachname"];
        let testData = ["Max","Mustermann"];
        let lp:LineProcessor = LineProcessor(columnMapping: mapping)

        let result = lp.processLines(testData)
        XCTAssertEqual("Max", result["name"] as String)
        XCTAssertEqual("Mustermann", result["nachname"] as String)
        XCTAssertEqual(2, result.count)
    }

    func testReadData() {
        var flp = FileLineReader(linesByGroup: 2)
        var lineGroups=flp.readAllLinesInGroups(findFileInResources("testData", ofType: "txt")!)
        XCTAssertEqual(2, lineGroups.count)
        XCTAssertEqual(2, lineGroups[0].count)
        XCTAssertEqual(2, lineGroups[1].count)

    }


        
}
