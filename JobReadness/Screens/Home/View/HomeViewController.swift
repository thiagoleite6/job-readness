//
//  HomeViewController.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 27/06/22.
//

import UIKit

//NSCache.. pesquisar..

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private lazy var presenter = HomePresenter(delegate: self)
    
    private var itemFilter = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
 
    private func configureUI() {
        view = homeView
        view.backgroundColor = UIColor(red: 1.00, green: 0.90, blue: 0.00, alpha: 1.00)
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
        homeView.delegate = self
        homeView.searchBarDelegate(delegate: self)
        
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchListTableViewCell.identifier,
                                                 for: indexPath) as! SearchListTableViewCell
        
        cell.setupCell(product: (presenter.highlightContent[indexPath.row]))
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        let product = presenter.highlightContent[indexPath.row]
        let detailsVC = DetailsViewController(product: product)
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
}

extension HomeViewController: HomePresenterDelegate, HomeViewDelegate {
    func willLoadTable() {
        homeView.tableView.reloadData()
        dump(presenter.highlightContent)
    }
    
    func handleTapped() {
        print("DEBUG: Back button tapped!!")
    }
}


extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.itemFilter = searchBar.text ?? ""
        self.presenter.fetchByCategory(category: itemFilter)
        print(itemFilter)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


