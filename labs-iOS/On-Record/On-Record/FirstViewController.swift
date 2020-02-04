//
//  FirstViewController.swift
//  On-Record
//
//  Created by Elsa Roeber on 2/2/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // constants for the two picker components
    let typeComponent = 0
    let choiceComponent = 1

    // variables
    var Emotions = EmotionsController()
    var types = [String]()
    var choices = [String]()

    @IBOutlet weak var feelingPicker: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load data using the emotionsController class instance
        do{
            try Emotions.loadData()
            types = try Emotions.getAllTypes()
            choices = try Emotions.getChoices(idx: 0)
        }catch{
            print(error)
        }
    }

    // one component needed to build this picker, thus the "return 1"
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // return the right number  of rows based on the size of current array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == typeComponent{
            return types.count
        }else if component == choiceComponent{
            return choices.count
        }else{
            print("unknown component")
            return -1
        }
    }
    
    // get the titles for each row from the arrays
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == typeComponent{
            return types[row]
        }else if component == choiceComponent{
            return choices[row]
        }else{
            print("unknown component")
            return "unknown component"
        }
    }
    
    // using selected picker rows to do stuff in the UI
    func  pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update choices if user changes the type
        if component == typeComponent{
            // get the new list of choices
            do{
                choices = try Emotions.getChoices(idx: row)
            }catch{
                print(error)
            }
            // update choice component
            feelingPicker.reloadComponent(choiceComponent)
            feelingPicker.selectRow(0, inComponent: choiceComponent, animated: true)
        }
        //let type = pickerView.selectedRow(inComponent: typeComponent)
        let choice = pickerView.selectedRow(inComponent: choiceComponent)
        
        resultLabel.text = "And I feel? \(choices[choice])!"
    }

}
