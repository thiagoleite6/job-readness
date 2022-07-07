//
//  FavoritesViewController.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 27/06/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    
    private let favoritesView = FavoritesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Chamou a controller do favorites")

        view.backgroundColor = .systemPink
    }
    

}
