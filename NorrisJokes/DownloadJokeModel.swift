//
//  DownloadJokeModel.swift
//  NorrisJokes
//
//  Created by Слава Орлов on 19.05.2023.
//

import Foundation

class DownloadJokeModel {
    
    var firstController: DownloadJokeController?
    
    func getJoke() {
        
        NetworkManager.getJoke { textJoke, category, errortText in
            
            let joke = Joke(joke: textJoke!, category: category)
            
            DispatchQueue.main.async {
                self.firstController?.jokeLabel.text = textJoke
                StorageManager.saveJoke(joke: joke)
            }
        }
    }
}
