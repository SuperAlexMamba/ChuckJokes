//
//  CategoryesViewController.swift
//  NorrisJokes
//
//  Created by Слава Орлов on 19.05.2023.
//

import UIKit
import RealmSwift

class CategoriesViewController: UITableViewController {
    
    var jokes = [Model]()
    
    var categories: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jokes = realm.objects(Joke.self)
        
        let unqueCategories = Set(jokes.map {$0.category })
        
        categories.append(contentsOf: unqueCategories)
        
    }
    
    func getJokesForCategoty(category: String) -> [Model] {
                
        let categories = realm.objects(Joke.self).filter("category == %@", category)
        
        var jokes = [Model]()
        
        for item in categories {
            
            let model = Model(value: item.joke , categories: [item.category])
            jokes.append(model)
        }
    
        return jokes
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        jokes = getJokesForCategoty(category: selectedCategory)
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let currentJokeVC = segue.destination as! CurrentJokeController
            currentJokeVC.models = jokes
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let category = categories[indexPath.row]
                
        var config = UIListContentConfiguration.cell()
        
        config.text = category
        
        cell.contentConfiguration = config
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
