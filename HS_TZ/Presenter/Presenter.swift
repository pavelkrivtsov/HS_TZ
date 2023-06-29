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
        tableManager.setData(data)
    }
}

// MARK: - TableManagerOutput
extension Presenter: TableManagerOutput {
    
}
