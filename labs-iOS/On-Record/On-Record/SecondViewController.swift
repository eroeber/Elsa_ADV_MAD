//
//  SecondViewController.swift
//  On-Record
//
//  Created by Elsa Roeber on 2/2/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // constant for the scheme
    let notesScheme = "mobilenotes://"
    let safariNote = "https://www.rapidtables.com/tools/notepad.html"
    
    // open the notes app
    func openNotes(scheme: String){
        if let url = URL(string: scheme){
            UIApplication.shared.open(url, options: [:], completionHandler: {
                (success) in
                print("open \(scheme): \(success)")
            })
        }
    }
    
    // check for access to the url scheme
    func schemeAvailable(scheme: String) -> Bool{
        if let url = URL(string: scheme){
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    //  open notes app, all apple devices have notes
    @IBAction func goToNotes(_ sender: Any) {
        // check for access
        let notesInstalled = schemeAvailable(scheme: notesScheme)
        if notesInstalled{
            openNotes(scheme: notesScheme)
        }else{
            openNotes(scheme: safariNote)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

