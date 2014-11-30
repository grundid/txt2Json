//
//  main.swift
//  txt2Json
//
//  Created by Adrian Stabiszewski on 30.11.14.
//  Copyright (c) 2014 GrundID GmbH. All rights reserved.
//

import Foundation

if (Process.arguments.count != 3) {
    println("Usage: txt2Json <inputFile> <columnMappings>")
} else {
    let inputFileName = Process.arguments[1];
    let columnMappingString:String = Process.arguments[2];
    let columnMapping = columnMappingString.componentsSeparatedByString(",")
    let lineProcessor = LineProcessor(columnMapping: columnMapping);
    let lineReader = FileLineReader(linesByGroup: columnMapping.count)

    var result = Array<NSDictionary>()
    
    let linesInGroups = lineReader.readAllLinesInGroups(inputFileName);
    for group in linesInGroups {
        let singleObject = lineProcessor.processLines(group)
        result.append(singleObject)
    }

    let jsonWriter = JsonWriter()
    jsonWriter.writeJson(inputFileName+".json", object: result)

}
