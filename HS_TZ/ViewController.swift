//
//  ViewController.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 28.06.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let presenter: PresenterInput
    private let tableView: UITableView
    
    init(presenter: PresenterInput, tableView: UITableView) {
        self.presenter = presenter
        self.tableView = tableView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}

extension ViewController: PresenterOutput {
    
    func configureNavigationBar() {
        
    }
}
