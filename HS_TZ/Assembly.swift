//
//  Assembly.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 28.06.2023.
//

import UIKit

final class Assembly {
    
    static func assemble()-> UIViewController {
        let tableView = UITableView()
        let networkService = NetworkService()
        let presenter = Presenter(networkService: networkService)
        networkService.presenter = presenter
        let view = ViewController(presenter: presenter, tableView: tableView)
        presenter.view = view
        return view
    }
}
