//
//  HomeViewModel.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 29/06/22.
//

import Foundation

protocol HomePresenterDelegate: AnyObject {
    func willLoadTable()
}

final class HomePresenter {
    
    weak var delegate: HomePresenterDelegate?
    
    private let jobReadnessService = JobReadnessService()
    
    var categoryId: String?
    
    var highlightContent = [ItemFromCategory]()
    
    
    init(delegate: HomePresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetchByCategory(category: String) {
        jobReadnessService.fetchCategorySearched(category: category) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let id = result[0].categoryID
                self.categoryId = id
                if let categoryId = self.categoryId {
                    self.fetchHighlightsPerCategory(categoryID: categoryId)
                    self.delegate?.willLoadTable()
                }
            }
        }
    }
    
    
    func fetchHighlightsPerCategory(categoryID: String) {
        jobReadnessService.getHighlightsCategory(categoryID: categoryID) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let items = result.content
                for (index, _ ) in items.enumerated() {
                    self.fetchItemsPerCategory(itemID: items[index].id)
                }
            }
        }
    }
    
    func fetchItemsPerCategory(itemID: String) {
        jobReadnessService.getItemsFromContent(ContentID: itemID) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let data = result[0].body
                let product = ItemFromCategory(id: data.id,
                                               pictures: data.pictures,
                                               title: data.title,
                                               subtitle: data.subtitle,
                                               price: data.price)
                
                self.highlightContent.append(product)
                self.delegate?.willLoadTable()
            }
        }
    }
    
    func getNumberOfRows() -> Int {
        return highlightContent.count
    }
    
    func getItem(at index: Int) -> ItemFromCategory {
        return highlightContent[index]
    }
    

}
