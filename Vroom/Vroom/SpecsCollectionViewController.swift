//
//  SpecsCollectionViewController.swift
//  Vroom
//
//  Created by Elsa Roeber on 3/5/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SpecsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    // array for names of all the truck images
    var truckImages = [String]()

    var namesDetails = DataController()
    var truckNamesArray = [String]()
    var truckDebutData = [String]()
    var truckSongData = [String]()
    var songSpeedData = [String]()
    var truckColorData = [String]()
    
    // variables for layout stuff
    let spacing : CGFloat = 8
    let numberOfItemsPerRow : CGFloat = 2
    let spacingBetweenCells : CGFloat = 12

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // populate array with truck names FOR IMAGES
        for i in 0...9{
            truckImages.append("assets-" + String(i))
        }
        
        // create a layout and set some properties
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        // load the truck names and details data from p-list
        do {
            try namesDetails.loadData()
            truckNamesArray = try namesDetails.getAllNames()
            truckDebutData = try namesDetails.getDebuts()
            truckSongData = try namesDetails.getSongs()
            songSpeedData = try namesDetails.getBPM()
            truckColorData = try namesDetails.getRGB()
        } catch {
            print(error)
        }

    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return truckImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get the cell and downcast to access the imageView property from our Cell class
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // construct UIImage and set ImageView Source
        let image = UIImage(named: truckImages[indexPath.row])
        cell.imageView.image = image
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        // amount of total spacing
        let totalSpacing = (2*spacing) + ((numberOfItemsPerRow-1)*spacingBetweenCells)
        // get size of each item
        let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
        
        return CGSize(width: width, height: width)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get the new view controller
        // pass selected image to the new view controller
        if segue.identifier == "showDetail"{
            // reference to destination
            let detailVC =  segue.destination as! DetailViewController
            // get the cell that is triggering the segue
            let indexPath = collectionView.indexPath(for: sender as! CollectionViewCell)
            // set title
            // detailVC.title = "Truck #\(indexPath!.row)"
            // set the image name property
            detailVC.imageName = truckImages[indexPath!.row]
            //detailVC.truckName = truckNames[indexPath!.row]
            detailVC.truckName = truckNamesArray[indexPath!.row]
            detailVC.truckDebut = String(truckDebutData[indexPath!.row])
            detailVC.truckSong = truckSongData[indexPath!.row]
            detailVC.songBPM = songSpeedData[indexPath!.row]
            detailVC.rgbSum = truckColorData[indexPath!.row]
        }
    }

}
