//
//  FirstViewController.swift
//  Vroom
//
//  Created by Elsa Roeber on 3/5/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // stepper
    @IBOutlet weak var choicesLabel: UILabel!
    @IBOutlet weak var choiceStepper: UIStepper!
    
    // image outlets
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    var newImage : String?
    var newNames = [String]()
    var newDebuts = [String]()
    var newBPMs = [String]()
    var newRGBs = [String]()
    var newImages = [String]()
    
    var full1 = false
    var full2 = false
    var full3 = false
    var full4 = false
    var full5 = false
    var full6 = false
    
    // send variables
    var sendName : String?
    var sendImage : String?
    
    @IBAction func updateChoices(_ sender: UIStepper) {
        choicesLabel.text = String(format: "%.0f", choiceStepper.value) + " choices"
        
        if choiceStepper.value == 2{
            image1.image = UIImage(named:"vroom-plus-3")
            image2.image = UIImage(named:"vroom-plus-3")
            image3.image = nil
            image4.image = nil
            image5.image = nil
            image6.image = nil
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = false
            button4.isEnabled = false
            button5.isEnabled =  false
            button6.isEnabled =  false
            
            full1 = false
            full2 = false
            full3 = false
            full4 = false
            full5 = false
            full6 = false
            
            newNames.removeAll()
            newDebuts.removeAll()
            newBPMs.removeAll()
            newRGBs.removeAll()
            newImages.removeAll()
        } else if choiceStepper.value == 3{
            image1.image = UIImage(named:"vroom-plus-3")
            image2.image = UIImage(named:"vroom-plus-3")
            image3.image = UIImage(named:"vroom-plus-3")
            image4.image = nil
            image5.image = nil
            image6.image = nil
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = false
            button5.isEnabled =  false
            button6.isEnabled =  false
            
            full1 = false
            full2 = false
            full3 = false
            full4 = false
            full5 = false
            full6 = false
            
            newNames.removeAll()
            newDebuts.removeAll()
            newBPMs.removeAll()
            newRGBs.removeAll()
            newImages.removeAll()
        } else if choiceStepper.value == 4{
            image1.image = UIImage(named:"vroom-plus-3")
            image2.image = UIImage(named:"vroom-plus-3")
            image3.image = UIImage(named:"vroom-plus-3")
            image4.image = UIImage(named:"vroom-plus-3")
            image5.image = nil
            image6.image = nil
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled =  false
            button6.isEnabled =  false
            
            full1 = false
            full2 = false
            full3 = false
            full4 = false
            full5 = false
            full6 = false
            
            newNames.removeAll()
            newDebuts.removeAll()
            newBPMs.removeAll()
            newRGBs.removeAll()
            newImages.removeAll()
        } else if choiceStepper.value == 5{
            image1.image = UIImage(named:"vroom-plus-3")
            image2.image = UIImage(named:"vroom-plus-3")
            image3.image = UIImage(named:"vroom-plus-3")
            image4.image = UIImage(named:"vroom-plus-3")
            image5.image = UIImage(named:"vroom-plus-3")
            image6.image = nil
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled =  true
            button6.isEnabled =  false
            
            full1 = false
            full2 = false
            full3 = false
            full4 = false
            full5 = false
            full6 = false
            
            newNames.removeAll()
            newDebuts.removeAll()
            newBPMs.removeAll()
            newRGBs.removeAll()
            newImages.removeAll()
        } else if choiceStepper.value == 6{
            image1.image = UIImage(named:"vroom-plus-3")
            image2.image = UIImage(named:"vroom-plus-3")
            image3.image = UIImage(named:"vroom-plus-3")
            image4.image = UIImage(named:"vroom-plus-3")
            image5.image = UIImage(named:"vroom-plus-3")
            image6.image = UIImage(named:"vroom-plus-3")
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled =  true
            button6.isEnabled =  true
            
            full1 = false
            full2 = false
            full3 = false
            full4 = false
            full5 = false
            full6 = false
            
            newNames.removeAll()
            newDebuts.removeAll()
            newBPMs.removeAll()
            newRGBs.removeAll()
            newImages.removeAll()
        }
    }
    
    @IBAction func checkChoices(_ sender: UIStepper) {
        // if the user is trying to have only one choice
        if choiceStepper.value == 1{
            let alert1 = UIAlertController(title: "Warning", message: "There must be at least 2 items you're choosing between.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                self.choiceStepper.value = 2
                self.choicesLabel.text = "2 choices"
            })
            alert1.addAction(okAction)
            present(alert1, animated: true, completion: nil)
        }
        // if user is trying to have over six choices
        if choiceStepper.value == 7{
            let alert2 = UIAlertController(title: "Tap the brakes", message: "Try and narrow down your decision!", preferredStyle: UIAlertController.Style.alert)
            let okAction2 = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                self.choiceStepper.value = 6
                self.choicesLabel.text = "6 choices"
            })
            alert2.addAction(okAction2)
            present(alert2, animated: true, completion: nil)
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        // get the new view controller
        // pass selected image to the new view controller
        if segue.identifier == "save"{
            // reference to destination
            let source =  segue.source as! ListTableViewController
            if(source.sendImage != nil){
                newImage = source.sendImage
                newNames.append(source.sendName!)
                newDebuts.append(source.sendDebut!)
                newBPMs.append(source.sendBPM!)
                newRGBs.append(source.sendRGB!)
                newImages.append(source.sendImage!)
                updateImage()
            }

        } else if segue.identifier == "done" {
            choiceStepper.value = 2
            
            image1.image = UIImage(named:"vroom-plus-3")
            image2.image = UIImage(named:"vroom-plus-3")
            
            full1 = false
            full2 = false
            full3 = false
            full4 = false
            full5 = false
            full6 = false
            
            newNames.removeAll()
            newDebuts.removeAll()
            newBPMs.removeAll()
            newRGBs.removeAll()
            newImages.removeAll()
        }
    }
    
    func updateImage(){  // add images for each truck to populate the placeholders
        // use the newImage recieved from table view and replace the placeholder
        print(newNames)
        if(choiceStepper.value == 2){
            if(full1 == false && full2 == false){
                image1.image = UIImage(named: newImage!)
                full1 = true
            } else if (full1 == true && full2 == false){
                image2.image = UIImage(named: newImage!)
                full2 = true
            }
        } else if(choiceStepper.value == 3){
            if(full1 == false && full2 == false && full3 == false){
                image1.image = UIImage(named: newImage!)
                full1 = true
            } else if (full1 == true && full2 == false && full3 == false){
                image2.image = UIImage(named: newImage!)
                full2 = true
            } else if (full1 == true && full2 == true && full3 == false){
                image3.image = UIImage(named: newImage!)
                full3 = true
            }
        } else if(choiceStepper.value == 4){
            if(full1 == false && full2 == false && full3 == false && full4 == false){
                image1.image = UIImage(named: newImage!)
                full1 = true
            } else if (full1 == true && full2 == false && full3 == false && full4 == false){
                image2.image = UIImage(named: newImage!)
                full2 = true
            } else if (full1 == true && full2 == true && full3 == false && full4 == false){
                image3.image = UIImage(named: newImage!)
                full3 = true
            } else if (full1 == true && full2 == true && full3 == true && full4 == false){
                image4.image = UIImage(named: newImage!)
                full4 = true
            }
        }  else if(choiceStepper.value == 5){
            if(full1 == false && full2 == false && full3 == false && full4 == false && full5 == false){
                image1.image = UIImage(named: newImage!)
                full1 = true
            } else if (full1 == true && full2 == false && full3 == false && full4 == false && full5 == false){
                image2.image = UIImage(named: newImage!)
                full2 = true
            } else if (full1 == true && full2 == true && full3 == false && full4 == false && full5 == false){
                image3.image = UIImage(named: newImage!)
                full3 = true
            } else if (full1 == true && full2 == true && full3 == true && full4 == false && full5 == false){
                image4.image = UIImage(named: newImage!)
                full4 = true
            } else if (full1 == true && full2 == true && full3 == true && full4 == true && full5 == false){
                image5.image = UIImage(named: newImage!)
                full5 = true
            }
        } else if(choiceStepper.value == 6){
            if(full1 == false && full2 == false && full3 == false && full4 == false && full5 == false && full6 == false){
                image1.image = UIImage(named: newImage!)
                full1 = true
            } else if (full1 == true && full2 == false && full3 == false && full4 == false && full5 == false && full6 == false){
                image2.image = UIImage(named: newImage!)
                full2 = true
            } else if (full1 == true && full2 == true && full3 == false && full4 == false && full5 == false && full6 == false){
                image3.image = UIImage(named: newImage!)
                full3 = true
            } else if (full1 == true && full2 == true && full3 == true && full4 == false && full5 == false && full6 == false){
                image4.image = UIImage(named: newImage!)
                full4 = true
            } else if (full1 == true && full2 == true && full3 == true && full4 == true && full5 == false && full6 == false){
                image5.image = UIImage(named: newImage!)
                full5 = true
            } else if (full1 == true && full2 == true && full3 == true && full4 == true && full5 == true && full6 == false){
                image6.image = UIImage(named: newImage!)
                full6 = true
            }

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "choose"){
            if(newNames.count == Int(choiceStepper.value)){
                let choiceVC =  segue.destination as! ChoiceViewController
                sendName  =  self.calculateWinner()
                if sendName != nil {
                    choiceVC.newText = sendName
                    choiceVC.newImage = sendImage
                } else {
                    print("no  sendName value")
                }
            } else if (newNames.count < Int(choiceStepper.value)){
                let alert = UIAlertController(title: "Slow down!", message: "Please select a truck for each decision contender", preferredStyle: .alert)
                // create the action buttons
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil) // "save" segue sends relevant variables back to firstViewController
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                alert.addAction(okAction)
                alert.addAction(cancel)
                present(alert, animated: true, completion: nil)
            } else  {
                var j = Int(choiceStepper.value)
                while(j < (newNames.count-1)){
                    newNames.remove(at: j)
                    newDebuts.remove(at: j)
                    newBPMs.remove(at: j)
                    newRGBs.remove(at: j)
                    newImages.remove(at: j)
                    j += 1
                }
                let choiceVC =  segue.destination as! ChoiceViewController
                sendName  =  self.calculateWinner()
                if sendName != nil {
                    choiceVC.newText = sendName
                    choiceVC.newImage = sendImage
                } else {
                    print("no  sendName value")
                }
            }
        }
    }
    
    func calculateWinner() -> String{
        //print("hello calculate winner")
        var finalResult : String?
        var max = 0 // max sum of rgb and bpm value
        var maxIdx = 0 // index of max value
        // var max2 = 0
        var max2Idx = 0
        let truckCount = Int(choiceStepper.value)
        var i = 0
        
        while (i < truckCount){
            if((Int(newRGBs[i])! + Int(newBPMs[i])!) > max){
                // max2 = max
                max = Int(newRGBs[i])! + Int(newBPMs[i])!
                max2Idx = maxIdx
                maxIdx = i
            }
            i += 1
        }
        
        if(Int(newDebuts[max2Idx])! > Int(newDebuts[maxIdx])!){  // max is older
            finalResult = newNames[maxIdx]
            // assign image
            sendImage = newImages[maxIdx]
        } else { // max2 is older
            finalResult = newNames[max2Idx]
            sendImage = newImages[max2Idx]
        }
        
        
        
        // print(max2)
        return finalResult!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceStepper.value = 2
    }


}

