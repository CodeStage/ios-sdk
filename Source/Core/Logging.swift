//
//  Logging.swift
//  Figo
//
//  Created by Christian König on 24.11.15.
//  Copyright © 2015 CodeStage. All rights reserved.
//

import Foundation


func debugPrintRequest(request: NSURLRequest?, _ response: NSHTTPURLResponse?, _ data: NSData?) {
    debugPrint("⬆️")
    if let request = request {
        debugPrint("\(request.HTTPMethod!) \(request.URLString)")
        if let fields = request.allHTTPHeaderFields {
            for (key, value) in fields {
                debugPrint(key + ": " + value)
            }
        }
        if let data = request.HTTPBody {
            if let JSON = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) {
                debugPrint(JSON)
            }
        }
    }
    debugPrint("⬇️")
    if let response = response {
        debugPrint(response)
    }
    if let data = data {
        if let string = String(data: data, encoding: NSUTF8StringEncoding) {
            if let JSON = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) {
                debugPrint(JSON)
            } else {
                debugPrint(string)
            }
        }
    }
}