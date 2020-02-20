//
//  DetailViewController.swift
//  breaded
//
//  Created by Elsa Roeber on 2/19/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var sandwichesData = SandwichDataController()
    var selectedSandwich = 0
    var ingredientList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool){
        ingredientList = sandwichesData.getIngredients(idx: selectedSandwich)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredientList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = ingredientList[indexPath.row]

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // notify data model
            ingredientList.remove(at: indexPath.row)
            // update instance
            sandwichesData.deleteIngredient(dataIdx: selectedSandwich, ingredientIdx: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // get index of rows
        let fromRow = fromIndexPath.row
        let toRow = to.row
        // get name of sandwich being moved
        let moveIngredient = ingredientList[fromRow]
        // swap in array
        ingredientList.swapAt(fromRow, toRow)
        
        // swap in data controller
        sandwichesData.deleteIngredient(dataIdx: selectedSandwich, ingredientIdx: fromRow)
        sandwichesData.addIngredient(dataIdx: selectedSandwich, newIngredient: moveIngredient, ingredientIdx: toRow)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // unwind segue method (from the add ingredient view)
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        // check id of segue
        if segue.identifier == "save"{
            // downcast to access members
            let source = segue.source as! AddIngredientViewController
            
            // double check to make sure addedFood name is not empty
            if source.addedFood.isEmpty == false{
                // add new ingredient to data model (notify changes)
                sandwichesData.addIngredient(dataIdx: selectedSandwich, newIngredient: source.addedFood, ingredientIdx: ingredientList.count)
                // add to working copy
                ingredientList.append(source.addedFood)
                // update table view based on data changes
                tableView.reloadData()
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
