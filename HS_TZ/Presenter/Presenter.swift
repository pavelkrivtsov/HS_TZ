//
//  Presenter.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 28.06.2023.
//

import Foundation

final class Presenter {
    
    weak var view: PresenterOutput?
    private let networkService: NetworkServiceInput
    private let tableManager: TableManagerInput
    
    init(networkService: NetworkServiceInput,
         tableManager: TableManagerInput) {
        self.networkService = networkService
        self.tableManager = tableManager
    }
}

// MARK: - PresenterInput
extension Presenter: PresenterInput {
    
    func viewDidLoad() {
        view?.configureNavigationBar()
        networkService.fetchData()
    }
}

// MARK: - NetworkServiceOutput
extension Presenter: NetworkServiceOutput {
    
    func returnData(_ data: [DataModel]) {
        let electronics = data.filter({$0.category == Category.electronics})
        let jewelery = data.filter({$0.category == Category.jewelery})
        let mensClothing = data.filter({$0.category == Category.mensClothing})
        let womensClothing = data.filter({$0.category == Category.womensClothing})
        let catalog: [DataModel] = electronics + jewelery + mensClothing + womensClothing
        tableManager.setData(catalog)
    }
}

// MARK: - TableManagerOutput
//extension Presenter: TableManagerOutput {
////    
////}
