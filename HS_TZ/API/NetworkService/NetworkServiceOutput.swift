//
//  NetworkServiceOut.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 29.06.2023.
//

import Foundation

protocol NetworkServiceOutput: AnyObject {
    func returnData(_ data: [DataModel])
}
