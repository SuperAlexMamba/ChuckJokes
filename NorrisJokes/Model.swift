//
//  Joke.swift
//  NorrisJokes
//
//  Created by Слава Орлов on 19.05.2023.
//

import Foundation
import RealmSwift

struct Model: Decodable {
    
    var value: String
    var categories: [String]
        
}

class Joke: Object {
    
    @Persisted var joke: String
    @Persisted var category: String
    
    convenience init(joke: String, category: String) {
        self.init()
        self .joke = joke
        self .category = category
    }
    
}
