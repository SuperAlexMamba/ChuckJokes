//
//  StorageManager.swift
//  NorrisJokes
//
//  Created by Слава Орлов on 19.05.2023.
//

import Foundation
import RealmSwift

let realm = try! Realm()

struct StorageManager {
        
    static func saveJoke(joke: Joke) {
        try! realm.write{
            realm.add(joke)
        }
    }
}
