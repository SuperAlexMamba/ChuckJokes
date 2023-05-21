//
//  CurrentJokeController.swift
//  NorrisJokes
//
//  Created by Слава Орлов on 20.05.2023.
//

import UIKit

class CurrentJokeController: UITableViewController {
    
    var models = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = models[indexPath.row].value

        return cell
    }
}
