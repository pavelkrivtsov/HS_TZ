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
        let navigationBarAppearence = UINavigationBarAppearance()
        navigationBarAppearence.shadowColor = nil
        navigationController?.navigationBar.standardAppearance = navigationBarAppearence
        navigationController?.navigationBar.standardAppearance.backgroundColor = Appearence.background
        
        let leftBarButton = UIButton(type: .system)
        leftBarButton.setTitle("Москва", for: .normal)
        leftBarButton.tintColor = Appearence.mainText
        leftBarButton.titleLabel?.font = Appearence.systemSemiboldFont
        leftBarButton.setImage(Appearence.arrowIcon, for: .normal)
        leftBarButton.semanticContentAttribute = .forceRightToLeft
        leftBarButton.imageEdgeInsets = .init(top: 2, left: 8, bottom: 0, right: 0)
        leftBarButton.addTarget(self, action: #selector(chooseCity), for: .touchUpInside)
        let leftButtonItem = UIBarButtonItem(customView: leftBarButton)
        navigationItem.leftBarButtonItem = leftButtonItem
    }
    
    @objc
    func chooseCity() {
        let alert = UIAlertController(title: "Упс...", message: "Выбор города не доступен", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
