//
//  HomeView.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 27/06/22.
//

import UIKit

protocol HomeViewDelegate {
    func handleTapped()
}

class HomeView: UIView {
    
    var delegate: HomeViewDelegate?
    
    lazy var barView: UIView = {
        let barView = UIView()
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.backgroundColor = UIColor(red: 1.00, green: 0.90, blue: 0.00, alpha: 1.00)
        
        return barView
    }()
    
    lazy var navigationBarStackView: UIStackView = {
        let navStackView = UIStackView()
        navStackView.translatesAutoresizingMaskIntoConstraints = false
        navStackView.axis = .horizontal
        navStackView.distribution = .fill
        navStackView.spacing = 17.0
        navStackView.alignment = .center
        
        return navStackView
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back-button"), for: .normal)
        btn.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var searchBarTextField: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = true
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchTextField.clipsToBounds = true
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.layer.shadowOpacity = 0.1
        searchBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        searchBar.tintColor = .black
        searchBar.sizeToFit()
        searchBar.placeholder = "Buscar no Mercado Livre"
        return searchBar
    }()
    
    lazy var cartButton: UIButton = {
        let cartBtn = UIButton()
        cartBtn.translatesAutoresizingMaskIntoConstraints = false
        cartBtn.setImage(UIImage(named: "cart"), for: .normal)
        
        //cartBtn.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return cartBtn
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchListTableViewCell.self, forCellReuseIdentifier: SearchListTableViewCell.identifier)
        tableView.rowHeight = 158
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    @objc func tappedBackButton() {
        print("Tapped!")
        delegate?.handleTapped()
    }
    
    private func configureSubViews() {
        addSubview(barView)
        barView.addSubview(navigationBarStackView)
        navigationBarStackView.addArrangedSubview(backButton)
        navigationBarStackView.addArrangedSubview(searchBarTextField)
        navigationBarStackView.addArrangedSubview(cartButton)
        addSubview(tableView)
    }
    
    func searchBarDelegate(delegate: UISearchBarDelegate) {
        searchBarTextField.delegate = delegate
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            barView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            barView.leadingAnchor.constraint(equalTo: leadingAnchor),
            barView.heightAnchor.constraint(equalToConstant: 54),
            barView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            navigationBarStackView.topAnchor.constraint(equalTo: barView.topAnchor),
            navigationBarStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            navigationBarStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            navigationBarStackView.bottomAnchor.constraint(equalTo: barView.bottomAnchor),
            
            searchBarTextField.heightAnchor.constraint(equalToConstant: 30),
            searchBarTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
            
        ])
    }
    
}


