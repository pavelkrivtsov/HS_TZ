//
//  TableManager.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 29.06.2023.
//

import UIKit

final class TableManager: NSObject {
    
    weak var presenter: TableManagerOutput?
    private let tableView: UITableView
    private var dataSource: UITableViewDiffableDataSource<Int, DataModel>!
    private var data: [DataModel] = []
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        self.tableView.delegate = self
        self.tableView.separatorInset = .zero
        self.tableView.separatorStyle = .singleLine
        self.tableView.allowsSelection = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        
        dataSource = UITableViewDiffableDataSource(tableView: self.tableView) { tableView, indexPath, item in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as? ProductCell else {
                fatalError("ProductCell is not registered for table view")
            }
            cell.configure(item)
            return cell
        }
    }
    
}

// MARK: - TableManagerInput
extension TableManager: TableManagerInput {
    
    func setData(_ data: [DataModel]) {
        self.data = data
        var snapshot = NSDiffableDataSourceSnapshot<Int, DataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(self.data)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension TableManager: UITableViewDelegate {
    
}
