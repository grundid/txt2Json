//
//  LineProcessor.swift
//  txt2Json
//
//  Created by Adrian Stabiszewski on 30.11.14.
//  Copyright (c) 2014 GrundID GmbH. All rights reserved.
//

import Foundation

public class LineProcessor {

    let columnMapping:[String]


    init(columnMapping:[String]) {
        self.columnMapping = columnMapping;
    }

    func processLines(lines:[String]) -> NSDictionary {
        var result = NSMutableDictionary()
        for (var index = 0; index < self.columnMapping.count;index++) {
            var key = self.columnMapping[index];
            var value = lines[index];
            result.setValue(value, forKey: key)
        }
        return result;
    }
}
