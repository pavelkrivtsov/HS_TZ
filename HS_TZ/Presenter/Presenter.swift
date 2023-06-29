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
    
    init(networkService: NetworkServiceInput) {
        self.networkService = networkService
    }
}

extension Presenter: PresenterInput {
    
    func viewDidLoad() {
        view?.configureTableView()
        view?.configureNavigationBar()
        networkService.fetchData()
    }
}

extension Presenter: NetworkServiceOutput {
    
    func returnData(_ data: [DataModel]) {
        print(data)
    }
}
