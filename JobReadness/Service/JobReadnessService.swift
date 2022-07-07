//
//  JobReadnessService.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 29/06/22.
//

import Foundation


final class JobReadnessService {
    
    let url_base = "https://api.mercadolibre.com"
    let api_token = "APP_USR-1557554659971003-070614-101dcd3da11c1fcf458995c1ade26149-234701377"
    
    // MARK: - FETCH CATEGORY
    
    func fetchCategorySearched(category: String, completion: @escaping ([Category]) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "\(url_base)/sites/MLB/domain_discovery/search?limit=1&q=\(category)")
        var request = URLRequest(url: url!)
        request.setValue(self.api_token, forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let data = data else { return }
                
                do {
                    let categoryID = try JSONDecoder().decode([Category].self, from: data)
                    completion(categoryID)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        task.resume()
        
    }
    
    // MARK: - FETCH TOP 20
    
    func getHighlightsCategory(categoryID: String, completion: @escaping (Content) -> Void) {
        
        let url = URL(string: "\(url_base)/highlights/MLB/category/\(categoryID)")
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(self.api_token)", forHTTPHeaderField: "Authentication")
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Authorization": "Bearer \(self.api_token)"]
        
        let session = URLSession(configuration: sessionConfiguration)
        
        
        let task = session.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let result = data else { return }
                do {
                    let content = try JSONDecoder().decode(Content.self, from: result)
                    completion(content)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    // MARK: - FETCH ITEMS FROM CATEGORY
    
    func getItemsFromContent(ContentID: String, completion: @escaping ([CategoryResponse]) -> Void ) {

        let url = URL(string: "\(url_base)/items?ids=\(ContentID)")
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(self.api_token)", forHTTPHeaderField: "Authentication")
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Authorization": "Bearer \(self.api_token)"]
        
        let session = URLSession(configuration: sessionConfiguration)
      
        let task = session.dataTask(with: request) { data, response, error in
            if error == nil {
                guard let result = data else { return }
                do {
                    let item = try JSONDecoder().decode([CategoryResponse].self, from: result)
                    completion(item)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        task.resume()
        
    }
}
