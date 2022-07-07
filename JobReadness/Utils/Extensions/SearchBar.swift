//
//  SearchBar.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 06/07/22.
//

import UIKit

// Alterar o nome do arquivo..
extension UISearchBar {
    func clearBackgroundColor() {
        guard let UISearchBarBackground: AnyClass = NSClassFromString("UISearchBarBackground") else { return }

        for view in subviews {
            for subview in view.subviews where subview.isKind(of: UISearchBarBackground) {
                subview.alpha = 0
            }
        }
    }
}
