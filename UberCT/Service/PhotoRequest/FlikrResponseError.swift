//
//  FlikrResponseError.swift
//  UberCT
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import Foundation

struct FlikrResponseError: Error {
    enum ErrorKind: Int {
        case unknown
        case urlError
        case parseError
    }
    
    var errorKind: ErrorKind
}
