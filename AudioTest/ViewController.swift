//
//  ViewController.swift
//  AudioTest
//
//  Created by Scott Krulcik on 2/19/15.
//  Copyright (c) 2015 Scott Krulcik. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

// 227766

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Color demo
        let base = UIView(frame: CGRectMake(0, 0, 300, 500))
        base.backgroundColor = Color.compoundBlue
        let blue = UIView(frame: CGRectMake(25,25, 100, 150))
        blue.backgroundColor = Color.primary
        let brown = UIView(frame: CGRectMake(175, 250, 100, 150))
        brown.backgroundColor = Color.compoundBrown
        view.addSubview(base)
        view.addSubview(blue)
        view.addSubview(brown)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        var alertSound = NSURL(string: "http://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3")
        println(alertSound)
        
        // Removed deprecated use of AVAudioSessionDelegate protocol
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
//        var error:NSError?
//        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
//        audioPlayer.prepareToPlay()
//        audioPlayer.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

