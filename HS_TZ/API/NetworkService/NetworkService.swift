//
//  NetworkService.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 28.06.2023.
//

import Foundation

final class NetworkService {
    
    weak var presenter: NetworkServiceOutput?
    private let url = "https://fakestoreapi.com/products"
}

extension NetworkService: NetworkServiceInput {
    
    func fetchData() {
        
        guard let url = URL(string: url) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let responseData = try JSONDecoder().decode([DataModel].self, from: data)
                self.presenter?.returnData(responseData)
            } catch let error {
                print(error)
            }

        }
        task.resume()
    }
    
}

