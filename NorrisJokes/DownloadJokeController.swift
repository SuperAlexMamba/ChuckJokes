//
//  DownloadJokeController.swift
//  NorrisJokes
//
//  Created by Слава Орлов on 19.05.2023.
//

import UIKit
import RealmSwift

class DownloadJokeController: UIViewController {
        
    @IBOutlet weak var jokeLabel: UILabel!
    
    private let model = DownloadJokeModel()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        model.firstController = self
    }
    
    @IBAction func downloadJoke(_ sender: UIButton) {
        model.getJoke()
    }
}
