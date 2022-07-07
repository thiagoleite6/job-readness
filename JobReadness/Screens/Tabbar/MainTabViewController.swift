//
//  MainTabViewController.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 27/06/22.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        configureViewControllers()
       
    }
    
    // MARK: - Methods
    
    func configureTabBar() {
        view.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.10).cgColor
    }
    
    private func configureViewControllers() {
        view.backgroundColor = .white
        let home = templateNavigationController(title: "Início", image: UIImage(named: "home")!, rootViewController: HomeViewController())
        let favorites = templateNavigationController(title: "Favoritos", image: UIImage(named: "heart")!, rootViewController: FavoritesViewController())
        let purchases = templateNavigationController(title: "Minhas Compras", image: UIImage(named: "bag")!, rootViewController: MyPurchasesViewController())
        let notification = templateNavigationController(title: "Notificações", image: UIImage(named: "bell")!, rootViewController: NotificationsViewController())
        let more = templateNavigationController(title: "Mais", image: UIImage(named: "bars")!, rootViewController: MoreViewController())
        
        viewControllers = [home, favorites, purchases, notification, more]
    }
    
    private func templateNavigationController(title: String, image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
   
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.title = title
        navigationController.navigationBar.isHidden = true
        
        return navigationController
    }
    
   
}
