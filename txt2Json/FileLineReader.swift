//
//  FileLineReader.swift
//  txt2Json
//
//  Created by Adrian Stabiszewski on 30.11.14.
//  Copyright (c) 2014 GrundID GmbH. All rights reserved.
//

import Foundation

public class FileLineReader {

    let linesByGroup:Int
    let fm = NSFileManager.defaultManager()

    init(linesByGroup:Int) {
        self.linesByGroup = linesByGroup;
    }


    public func readAllLinesInGroups(fileName:String) -> [[String]] {
        let data = fm.contentsAtPath(fileName)
        let fileContent:String = NSString(data: data!, encoding:NSUTF8StringEncoding) as String
        let lines = fileContent.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())

        var result = Array<Array<String>>()

        var group = Array<String>()
        var groupIndex = 0;
        for (var index = 0; index < lines.count;index++) {
            if (groupIndex == linesByGroup) {
                groupIndex = 0;
                result.append(group)
                group = Array<String>()
            }
            group.append(lines[index])
            groupIndex++
        }
        if (groupIndex > 0) {
            result.append(group)
        }

        return result;
    }


}