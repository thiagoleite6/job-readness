//
//  DetailsViewController.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 02/07/22.
//

import UIKit
import Kingfisher

final class DetailsViewController: UIViewController, DetailsViewDelegate {
  
    private let detailsView = DetailsView()
    
    private let product: ItemFromCategory
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }
    
    
    // MARK: - Initializer
    
    init(product: ItemFromCategory) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
        detailsView.delegate = self
        view = detailsView
        view.backgroundColor = UIColor(red: 1.00, green: 0.90, blue: 0.00, alpha: 1.00)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupData() {
        detailsView.largeTitleLabel.text = product.title
        detailsView.priceLabel.text = String(format: "R$ %.2f", product.price)
        detailsView.smallTitleLabel.text = product.subtitle
        detailsView.productImageView.kf.setImage(with: URL(string: product.pictures[0].secure_url)!)
        
    }
    
    func handleTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
