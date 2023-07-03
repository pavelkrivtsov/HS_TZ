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
    
    private let sectionHeader = CategoryHeader()
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        configureTableView()
        configureMainHeader()
        addCategoryButtonGestureRecognizers()
    }
    
    private func configureTableView() {
        self.tableView.backgroundColor = #colorLiteral(red: 0.9510702491, green: 0.96117872, blue: 0.9737285972, alpha: 1)
        self.tableView.delegate = self
        self.tableView.separatorInset = .zero
        self.tableView.separatorStyle = .singleLine
        self.tableView.allowsSelection = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(CategoryHeader.self, forHeaderFooterViewReuseIdentifier: CategoryHeader.reuseId)
        self.tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        
        dataSource = UITableViewDiffableDataSource(tableView: self.tableView) { tableView, indexPath, item in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as? ProductCell else {
                fatalError("ProductCell is not registered for table view")
            }
            cell.configure(item)
            return cell
        }
    }
    
    private func configureMainHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: 0, height: 100))
        headerView.backgroundColor = .red
        self.tableView.tableHeaderView = headerView
        self.tableView.sectionHeaderTopPadding = 0
    }
    
    private func addCategoryButtonGestureRecognizers() {
        for button in sectionHeader.buttonsStack.arrangedSubviews {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(categoryButtonSelected(sender: )))
            button.addGestureRecognizer(gesture)
        }
    }
    
    @objc
    private func categoryButtonSelected(sender: UITapGestureRecognizer) {
        guard let button = sender.view as? UIButton else { return }
        if let category = Category(rawValue: button.titleLabel?.text ?? "" ) {
            if let categoryIndex = data.firstIndex(where: { $0.category == category}) {
                tableView.scrollToRow(at: IndexPath(row: categoryIndex, section: 0), at: .top, animated: true)
            }
        }
    }
    
}

// MARK: - TableManagerInput
extension TableManager: TableManagerInput {
    
    func setData(_ data: [DataModel]) {
        self.data = data
        var snapshot = NSDiffableDataSourceSnapshot<Int, DataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - UITableViewDelegate
extension TableManager: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sectionHeader
    }
}
