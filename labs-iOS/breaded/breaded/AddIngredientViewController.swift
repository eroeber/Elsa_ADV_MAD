//
//  AddIngredientViewController.swift
//  breaded
//
//  Created by Elsa Roeber on 2/19/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class AddIngredientViewController: UITableViewController {
    
    //  hold our array of foods to add
    var words = [String]()
    var data = FoodDataController()  // instance of FoodDataController
    var addedFood = String()

    // add instance of search controller
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            try data.loadWords()
            words = try data.getWords()
            // create an instance of results controller
            let resultsController = SearchResultsController()
            // set all the words based on loaded data
            resultsController.allWords = words
            // tell the search controller to use ours
            searchController = UISearchController(searchResultsController: resultsController)
            // add placeholder text
            searchController.searchBar.placeholder = "Filter"
            searchController.searchBar.sizeToFit() // fits the parent view
            // add a header that consists  of the search bar that belongs to our search controller
            tableView.tableHeaderView = searchController.searchBar
            searchController.searchResultsUpdater = resultsController
        }catch{
            print("could not load sandwich ingredients")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    // customize number of ro
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return words.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = words[indexPath.row]

        return cell
    }
    
    // what if user selects a row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Add this item?", message: "You selected \(words[indexPath.row])", preferredStyle: .alert)
        // create action buttons
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "save", sender: nil)
        })
        let noAction = UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "cancel", sender: nil)
        })
        // add segue here back to the other view (with new item)
        addedFood = words[indexPath.row]
        // add actions to alert
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  only care if they hit "ok"
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
