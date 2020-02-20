//
//  SearchResultsController.swift
//  breaded
//
//  Created by Elsa Roeber on 2/19/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController, UISearchResultsUpdating {
    // implement the search
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text // get the text entered into search bar
        filteredWords.removeAll() // empty array of filtered words from older searches
        
        // make sure there is a new value
        if searchString?.isEmpty == false{
            // closure to filter through all words
            let searchFilter: (String) -> Bool = { word in
                let range = word.range(of: searchString!, options: .caseInsensitive)
                // range will be nil if the character sequence is not present in given word
                return range != nil
            }
            // use the closure to filter through all words
            filteredWords = allWords.filter(searchFilter)
        }
        // update the table with relevant words
        tableView.reloadData()
    }
    
    
    // variables
    var allWords = [String]()
    var filteredWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // no storyboard scene so programmatically register the cell reuse identifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "addCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath)

        cell.textLabel?.text = filteredWords[indexPath.row]

        return cell
    }
    
    // DO SOMETHING WHEN USER SELECTS A SEACRCH THING MAYBE

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
