//
//  NetworkManager.swift
//  NorrisJokes
//
//  Created by Слава Орлов on 19.05.2023.
//

import Foundation

class NetworkManager {
            
    static func getJoke(completion: ((_ textJoke: String?, _ category: String, _ errortText: String?) -> Void)?) {
        
        let url = URL(string: "https://api.chucknorris.io/jokes/random")
        
        let request = URLRequest(url: url!)
        
        var category: String = ""
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error  {
                print(error.localizedDescription)
                return
            }
            
            guard let data else {
                print("Error with create data")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Model.self, from: data)
                
                for (_ , item) in json.categories.enumerated() {
                    category = item
                }
                
                completion?(json.value,
                            category,
                            nil)
                
            }
            catch {
                print(error)
            }
        }
        session.resume()
    }
}
