//
//  ViewController.swift
//  breaded
//
//  Created by Elsa Roeber on 2/19/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    //  instance of our sandwich controller
    var sandwichList = [String]()
    var sandwichDataController = SandwichDataController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // load the data and get sandwich list
        do{
            try sandwichDataController.loadData()
            sandwichList = sandwichDataController.getSandwiches()
        }catch{
            print(error)
        }
        
        // get app instance
        let app = UIApplication.shared
        
        // subscribe to willResignActive notification
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.applicationWillResignActive(_:)), name: UIApplication.willResignActiveNotification, object: app)
    }
    
    @objc func applicationWillResignActive(_ notification: NSNotification){
        do{
            try sandwichDataController.writeData()
        }catch{
            print(error)
        }
    }
    
    // set up table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sandwichList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SandwichCell", for: indexPath)
        cell.textLabel?.text = sandwichList[indexPath.row]
        return cell
    }
    
    // send proper data when a specific sandwich is selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ingredientSegue"{
            // get reference to DetailViewController (need to downcast from UIViewController)
            let detailVC =  segue.destination as! DetailViewController
            // get the cell that triggered the segue (downcast!)
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            // set data in destination controller
            if let selection = indexPath?.row{
                detailVC.selectedSandwich = selection
                detailVC.title = sandwichList[selection]
                detailVC.sandwichesData = sandwichDataController
            }
        }
    }


}

