//
//  ThirdViewController.swift
//  On-Record
//
//  Created by Elsa Roeber on 2/2/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    // instance variables
    let audioSession = AVAudioSession.sharedInstance()
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    
    // name for recording filename
    let filename = "audio.m4a"

    // OUTLETS
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    // ACTIONS
    
    // method for record button
    @IBAction func recordAudio(_ sender: Any) {
        // make sure there is instance of recorder
        if let recorder = audioRecorder{
            // check to make sure it isn't already recording
            if recorder.isRecording == false{
                // enable stop button and start recording
                playButton.isEnabled = false
                stopButton.isEnabled = true
                recorder.delegate = self // allows recorder to respond to errors and complete the recording
                recorder.record()
            }else{
                print("no audio recorder instance")
            }
        }
    }
    
    // method  for stop button: stops either playing or recording depending on which is active
    @IBAction func stopAudio(_ sender: Any) {
        stopButton.isEnabled = false
        playButton.isEnabled = true
        recordButton.isEnabled = true
        
        // stop recording if that's the current task
        if audioRecorder?.isRecording == true{
            audioRecorder?.stop()
        }else{ // stop the playback of the audio
            audioPlayer?.stop()
            // reset session mode
            do{
                try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    // method for play button
    @IBAction func playAudio(_ sender: Any) {
        // make sure we aren't recording
        if audioRecorder?.isRecording == false{
            stopButton.isEnabled = true
            recordButton.isEnabled = false
            
            do{
                try audioPlayer = AVAudioPlayer(contentsOf: (audioRecorder?.url)!)
                // set playback mode for optimal volume
                try audioSession.setCategory(AVAudioSession.Category.playback)
                audioPlayer!.delegate = self
                audioPlayer!.prepareToPlay() // preload audio
                audioPlayer!.play() // plays audio
            }catch{
                print("audio player error: \(error.localizedDescription)")
            }
        }
    }
    
    // audio player delegate method to change buttons when audio finishes playing
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordButton.isEnabled = true
        stopButton.isEnabled = false
        
        // reset AV session mode for recording
        do{
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    // set up and initialize audio in viewDidLoad!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // disable  play and stop since there is nothing there on load
        playButton.isEnabled =  false
        stopButton.isEnabled = false
        
        // get path for audio file
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0]
        let audioFileURL = docDir.appendingPathComponent(filename)
        print(audioFileURL)
        
        // configure our audio session
        do{
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .default, options: .init(rawValue: 1))
        }catch{
            print("audio session error: \(error.localizedDescription)")
        }
        
        // declare our settings in a directory
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC), // audio codec
            AVSampleRateKey: 1200, // sample rate in hZ
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue  // audio bit rate
        ]
        
        do{
            // create instance of recorder
            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
            // prepare it for recording by creating audio file at specified location
            audioRecorder?.prepareToRecord()
            print("audio recorder ready")
        }catch{
            print("audio recorder error: \(error.localizedDescription)")
        }
    }

}
