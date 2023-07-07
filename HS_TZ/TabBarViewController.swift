//
//  TabBarController.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 07.07.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = Appearence.accent
        
        viewControllers = [
            createNavigationController(rootViewController: Assembly.assemble(), title: "Меню"),
        ]
        
        for name in ["Контакты","Профиль","Корзина"] {
            let otherVC = OtherViewController(name: name)
            let navigationVC = createNavigationController(rootViewController: otherVC, title: name)
            viewControllers?.append(navigationVC)
        }
    }
    
    private func createNavigationController(rootViewController: UIViewController, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = UIImage(named: title)
        return navigationVC
    }
}
