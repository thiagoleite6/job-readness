//
//  DetailsView.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 02/07/22.
//

import Foundation
import UIKit

protocol DetailsViewDelegate {
  func handleTapped()
}

class DetailsView: UIView {
    
    // MARK: - Properties
    
    var delegate: DetailsViewDelegate?
    
    // MARK: - Components
    
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
        navStackView.spacing = 17.0
        navStackView.distribution = .equalSpacing
        
        return navStackView
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back-button"), for: .normal)
        btn.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var rightButtonsStackView: UIStackView = {
        let navStackView = UIStackView()
        navStackView.translatesAutoresizingMaskIntoConstraints = false
        navStackView.axis = .horizontal
        navStackView.spacing = 10
        navStackView.distribution = .equalSpacing
        
        return navStackView
    }()
    
    lazy var favoriteButton: UIButton = {
        let cartBtn = UIButton()
        cartBtn.translatesAutoresizingMaskIntoConstraints = false
        cartBtn.setImage(UIImage(named: "heart-2"), for: .normal)

        //cartBtn.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return cartBtn
    }()
    
    lazy var searchButton: UIButton = {
        let cartBtn = UIButton()
        cartBtn.translatesAutoresizingMaskIntoConstraints = false
        cartBtn.setImage(UIImage(named: "lupa"), for: .normal)
        
        //cartBtn.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return cartBtn
    }()
    
    lazy var cartButton: UIButton = {
        let cartBtn = UIButton()
        cartBtn.translatesAutoresizingMaskIntoConstraints = false
        cartBtn.setImage(UIImage(named: "cart"), for: .normal)
        
        //cartBtn.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return cartBtn
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var subHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1.00, green: 0.90, blue: 0.00, alpha: 1.00)
        return view
    }()
    
    lazy var locationIconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "loc")
        return image
    }()
    
    lazy var addressLabel: UILabel = {
        let addressLbl = UILabel()
        addressLbl.translatesAutoresizingMaskIntoConstraints = false
        addressLbl.text = "Rua Primeiro de Maio"
        addressLbl.font = UIFont.systemFont(ofSize: 14)
        
        return addressLbl
    }()
    
    
    lazy var smallTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Volkswagen Fox 1.6 Connect"
        lbl.font = UIFont.systemFont(ofSize: 12)
        
        
        return lbl
    }()
    
    lazy var largeTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text =  "Volkswagen Fox 1.6 Connect"
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        
        return lbl
    }()
    
    lazy var itemPrimaryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentMode = .redraw
        
        return view
    }()
    
   
    lazy var sellerVerificationLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text =  "Vendedor verificado"
        lbl.font =  UIFont.systemFont(ofSize: 11)
        
        return lbl
    }()
    
    
    lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text =  "R$ 2.200.00"
        lbl.font = UIFont.systemFont(ofSize: 36)
        
        return lbl
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 9
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.20, green: 0.51, blue: 0.98, alpha: 1.00)
        button.setTitle("Perguntar", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        return button
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.20, green: 0.51, blue: 0.98, alpha: 1.00)
        button.tintColor = .white
        button.setTitle("WhatsApp", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    @objc func tappedBackButton() {
        print("Tapped!")
        delegate?.handleTapped()
    }
    
    
    private func setUpViews() {
        addSubview(barView)
        barView.addSubview(navigationBarStackView)
        navigationBarStackView.addArrangedSubview(backButton)
        navigationBarStackView.addArrangedSubview(rightButtonsStackView)
        rightButtonsStackView.addArrangedSubview(favoriteButton)
        rightButtonsStackView.addArrangedSubview(searchButton)
        rightButtonsStackView.addArrangedSubview(cartButton)
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(subHeaderView)
        contentStackView.addArrangedSubview(itemPrimaryView)
        
        subHeaderView.addSubview(locationIconImage)
        subHeaderView.addSubview(addressLabel)
        
        itemPrimaryView.addSubview(smallTitleLabel)
        itemPrimaryView.addSubview(largeTitleLabel)
        itemPrimaryView.addSubview(sellerVerificationLabel)
        itemPrimaryView.addSubview(productImageView)
        itemPrimaryView.addSubview(priceLabel)
        itemPrimaryView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(buyButton)
        buttonStackView.addArrangedSubview(addToCartButton)
      
    }
    
    // MARK: Constraints
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            barView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            barView.leadingAnchor.constraint(equalTo: leadingAnchor),
            barView.trailingAnchor.constraint(equalTo: trailingAnchor),
            barView.heightAnchor.constraint(equalToConstant: 44),
            
            navigationBarStackView.topAnchor.constraint(equalTo: barView.topAnchor),
            navigationBarStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            navigationBarStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            navigationBarStackView.bottomAnchor.constraint(equalTo: barView.bottomAnchor),
            
            rightButtonsStackView.widthAnchor.constraint(equalToConstant: 90),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: barView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            subHeaderView.topAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.topAnchor),
            subHeaderView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            subHeaderView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            subHeaderView.heightAnchor.constraint(equalToConstant: 40),
            locationIconImage.centerYAnchor.constraint(equalTo: subHeaderView.centerYAnchor),
            locationIconImage.leadingAnchor.constraint(equalTo: subHeaderView.leadingAnchor, constant: 8),
            locationIconImage.heightAnchor.constraint(equalToConstant: 24),
            locationIconImage.widthAnchor.constraint(equalToConstant: 24),
            
            addressLabel.centerYAnchor.constraint(equalTo: locationIconImage.centerYAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: locationIconImage.trailingAnchor, constant: 8),
            addressLabel.trailingAnchor.constraint(equalTo: subHeaderView.trailingAnchor, constant: -16),

            itemPrimaryView.topAnchor.constraint(equalTo: subHeaderView.bottomAnchor),
            itemPrimaryView.leadingAnchor.constraint(equalTo: subHeaderView.leadingAnchor),
            itemPrimaryView.trailingAnchor.constraint(equalTo: subHeaderView.trailingAnchor),
            itemPrimaryView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            smallTitleLabel.topAnchor.constraint(equalTo: itemPrimaryView.topAnchor, constant: 20),
            smallTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            smallTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            largeTitleLabel.topAnchor.constraint(equalTo: smallTitleLabel.bottomAnchor, constant: 6),
            largeTitleLabel.leadingAnchor.constraint(equalTo: smallTitleLabel.leadingAnchor),
            largeTitleLabel.trailingAnchor.constraint(equalTo: smallTitleLabel.trailingAnchor),
            sellerVerificationLabel.topAnchor.constraint(equalTo: largeTitleLabel.bottomAnchor, constant: 4),
            sellerVerificationLabel.leadingAnchor.constraint(equalTo: largeTitleLabel.leadingAnchor),
            sellerVerificationLabel.trailingAnchor.constraint(equalTo: largeTitleLabel.trailingAnchor),
            productImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImageView.topAnchor.constraint(equalTo: sellerVerificationLabel.bottomAnchor, constant: 24),
            productImageView.leadingAnchor.constraint(equalTo: sellerVerificationLabel.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: sellerVerificationLabel.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 275),
            priceLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 24),
            priceLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor),
            buttonStackView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 24),
            buttonStackView.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 54),
           
        ])
    }
    
}
