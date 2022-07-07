//
//  SearchListTableViewCell.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 28/06/22.
//

import UIKit
import Kingfisher

class SearchListTableViewCell: UITableViewCell {

    static let identifier = "cell"
    
    lazy var contentCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var productImageView: UIImageView = {
        var productImageView = UIImageView()
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.layer.cornerRadius = 4
        productImageView.contentMode = .scaleAspectFit
        productImageView.clipsToBounds = true
        
        return productImageView
    }()
    
    private lazy var favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.clipsToBounds = true
        favoriteButton.layer.cornerRadius = 15
        favoriteButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        favoriteButton.addTarget(self, action: #selector(self.tappedFavoriteButton(_ :)), for: .touchUpInside)
        favoriteButton.tag = 1
        
        
        return favoriteButton
    }()
    
    lazy var productTitleLabel: UILabel = {
       var productTitleLabel = UILabel()
        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productTitleLabel.text = "Volkswagen Fox 1.6 Connect"
        productTitleLabel.font = UIFont.systemFont(ofSize: 13)
        productTitleLabel.textColor = .black
        productTitleLabel.lineBreakMode = .byWordWrapping
        productTitleLabel.numberOfLines = 0
        
        return productTitleLabel
    }()

    lazy var productPriceLabel: UILabel = {
        var productPriceLabel = UILabel()
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.text = "$ 45.000"
        productPriceLabel.font = UIFont.systemFont(ofSize: 20)
        productPriceLabel.textColor = .black

        return productPriceLabel
    }()
    
    lazy var productDescriptionTitleLabel: UILabel = {
        var productDescriptionTitleLabel = UILabel()
        productDescriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionTitleLabel.text = "2019 - 37.000 Km"
        productDescriptionTitleLabel.font = UIFont.systemFont(ofSize: 11)
        productDescriptionTitleLabel.textColor = UIColor(red: 0.60, green: 0.61, blue: 0.61, alpha: 1.00)

        return productDescriptionTitleLabel
    }()
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        contentView.isUserInteractionEnabled = true
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setupSubViews() {
        addSubview(contentCellView)
        contentCellView.addSubview(productImageView)
        addSubview(favoriteButton)
        contentCellView.addSubview(productTitleLabel)
        contentCellView.addSubview(productPriceLabel)
        contentCellView.addSubview(productDescriptionTitleLabel)
    }
    
    func setupCell(product: ItemFromCategory) {
        productImageView.kf.setImage(with: URL(string: product.pictures[0].secure_url))
        productTitleLabel.text = product.title
        productPriceLabel.text = String(format: "R$ %.02f", product.price)  
        productDescriptionTitleLabel.text = product.subtitle
        
    }
    
    @objc func tappedFavoriteButton(_ sender: Any) {
        print(sender)
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            productImageView.widthAnchor.constraint(equalToConstant: 131),
            productImageView.heightAnchor.constraint(equalToConstant: 131),
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            favoriteButton.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 6),
            favoriteButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                                     constant: -6),
            favoriteButton.widthAnchor.constraint(equalToConstant: 29),
            favoriteButton.heightAnchor.constraint(equalToConstant: 29),

            productTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            productTitleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),

            productPriceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 5),
            productPriceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),

            productDescriptionTitleLabel.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 7),
            productDescriptionTitleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),


        ])
    }
    
    
    
    
    
}
