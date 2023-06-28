//
//  PresenterOutput.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 28.06.2023.
//

import Foundation

protocol PresenterOutput: AnyObject {
    func configureTableView()
    func configureNavigationBar() 
}
