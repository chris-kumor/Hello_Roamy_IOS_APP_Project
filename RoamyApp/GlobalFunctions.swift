//
//  Global Functions.swift
//  Roamy App
//
//  Created by Christopher A. Kumor on 3/30/20.
//  Copyright © 2020 Christopher A. Kumor. All rights reserved.
//




import Foundation


public func CreateArray(fileinUse: String, listInUse: inout [String])
 {
     let contents = try! String(contentsOfFile: fileinUse)
     let lines = contents.split(separator:"\n")
     for line in lines
     {
         listInUse.append(String(line))
     }
 }
