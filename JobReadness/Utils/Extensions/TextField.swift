//
//  TextField.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 28/06/22.
//

import UIKit

extension UITextField {
    
    func setupLeftImage(imageName: String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 19, height: 18))
        imageView.image = UIImage(systemName: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 40))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
        tintColor = .lightGray
    }

}

