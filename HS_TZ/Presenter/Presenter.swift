//
//  Presenter.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 28.06.2023.
//

import Foundation

final class Presenter {
    
    weak var view: PresenterOutput?
    
}

extension Presenter: PresenterInput {
    
    func viewDidLoad() {
        view?.configureTableView()
        view?.configureNavigationBar()
    }
}
