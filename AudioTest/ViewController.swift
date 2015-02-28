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
import CustomElements

// 227766

class ViewController: UIViewController {
    var playlistManager:PlaylistManager
    var songStreamer:AVPlayer?
    
    @IBOutlet weak var playPauseHUD: PlayPause!
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    override init() {
        playlistManager = PlaylistManager()
        super.init()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        playlistManager = PlaylistManager()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init(coder aDecoder: NSCoder) {
        playlistManager = PlaylistManager()
        super.init(coder: aDecoder)
    }

    override func viewDidAppear(animated: Bool) {
        togglePlay()
    }
    
    @IBAction func toggleMusic(sender: AnyObject) {
        togglePlay()
    }
    
    @IBAction func swipeRight(sender: AnyObject) {
        NSLog("Swipe right on song %@", playlistManager.currentSong.title)
        playlistManager.forward()
        playNewSong(playlistManager.currentSong)
    }
    
    @IBAction func swipeLeft(sender: AnyObject) {
        NSLog("Swipe left on song %@", playlistManager.currentSong.title)
        playlistManager.forward()
        playNewSong(playlistManager.currentSong)
    }
    
    func togglePlay() {
        if (songStreamer != nil){
            if (songStreamer!.rate > 0
                && songStreamer!.error == nil) {
                //Player is already playing
                songStreamer!.pause()
                playPauseHUD.mode = .Pause
            } else {
                songStreamer!.play()
                playPauseHUD.mode = .Play
            }
        } else {
            playPauseHUD.mode = .Play
            playNewSong(playlistManager.currentSong)
        }
    }
    func playNewSong(song:Song){
        let songURL = NSURL(string: song.URL )
        if let playerItem = AVPlayerItem(URL: songURL) {
            self.infoFromSong(song)
            songStreamer = AVPlayer(playerItem: playerItem)
            songStreamer!.play()
        } else {
            NSLog("Error parsing song URL")
        }
    }
    
    func infoFromSong(song:Song) {
        songTitle.text = song.title
        artistName.text = song.artist
        if song.albumArtURL != nil {
            if let imgURL = NSURL(string: song.albumArtURL!) {
                println("Trying to dispatch on background thread")
                if let imgData = NSData(contentsOfURL: imgURL) {
                    self.albumArt.image = UIImage(data: imgData)
                }
            }
        }
        self.updateViewConstraints()
    }
}

