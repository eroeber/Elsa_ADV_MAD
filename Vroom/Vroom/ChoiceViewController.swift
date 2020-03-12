//
//  ChoiceViewController.swift
//  Vroom
//
//  Created by Elsa Roeber on 3/9/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultPic: UIImageView!
    
    var newText : String?
    var newImage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if newText != nil && newImage != nil{
            resultLabel.text = newText
            resultPic.image = UIImage(named: newImage!)
        } else {
            resultLabel.text = "no result!"
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
