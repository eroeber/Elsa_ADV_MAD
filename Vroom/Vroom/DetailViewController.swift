//
//  DetailViewController.swift
//  Vroom
//
//  Created by Elsa Roeber on 3/7/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var debutLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var bpmLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    // hold name of image (to load into image view)
    var imageName : String?
    // hold name of truck
    var truckName : String?
    // hold debut year
    var truckDebut : String?
    // hold theme song
    var truckSong : String?
    // hold bpm value
    var songBPM : String?
    //  hold rgb sum value
    var rgbSum : String?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = imageName{
            imageView.image = UIImage(named: name)
            nameLabel.text = truckName
            debutLabel.text = "Debut year: " + truckDebut!
            songLabel.text = "Theme song: " + truckSong!
            bpmLabel.text =  "Song BPM: " + songBPM!
            rgbLabel.text = "RGB Sum of truck body: " + rgbSum!
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
