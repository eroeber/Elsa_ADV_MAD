//
//  ListTableViewController.swift
//  Vroom
//
//  Created by Elsa Roeber on 3/8/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    // hold arrays of specific truck stuff (from data controller)
    var names = [String]()
    var images = [String]()
    var debuts = [String]()
    var bpms = [String]()
    var rgbs = [String]()
    // variables to send with segue
    var sendImage : String?
    var sendName : String?
    var sendDebut : String?
    var sendBPM : String?
    var sendRGB : String?
    
    // connect to data controller
    var namesDetails = DataController()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil
        for i in 0...9{
            images.append("assets-" + String(i))
        }
        // load data for truck names, debuts
        do {
            try namesDetails.loadData()
            names = try namesDetails.getAllNames()
            debuts = try namesDetails.getDebuts()
            bpms = try namesDetails.getBPM()
            rgbs = try namesDetails.getRGB()
            
        } catch {
            print(error)
        }

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
        return names.count
    }

    //  displays the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath)

        cell.textLabel?.text = names[indexPath.row]
        // sendName = names[indexPath.row]
//        sendImage = images[indexPath.row]
        return cell
    }
    
    // alert when user selects one, option to confirm or cancel
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Select this truck?", message: "Choose \(names[indexPath.row]) to represent this choice!", preferredStyle: .alert)
        // create the action buttons
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.sendImage = self.images[indexPath.row]
            self.sendName = self.names[indexPath.row]
            self.sendDebut = self.debuts[indexPath.row]
            self.sendBPM = self.bpms[indexPath.row]
            self.sendRGB = self.rgbs[indexPath.row]
            //self.sendBPM =
            self.performSegue(withIdentifier: "save", sender: nil)
            
         }) // "save" segue sends relevant variables back to firstViewController
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
