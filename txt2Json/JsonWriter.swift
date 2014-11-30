//
//  JsonWriter.swift
//  txt2Json
//
//  Created by Adrian Stabiszewski on 30.11.14.
//  Copyright (c) 2014 GrundID GmbH. All rights reserved.
//

import Foundation

class JsonWriter {

    func writeJson(fileName:String, object:AnyObject) {
        let jsonData = NSJSONSerialization.dataWithJSONObject(object, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
        jsonData?.writeToFile(fileName, atomically: true)
    }
}
