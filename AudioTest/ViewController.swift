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
    var playlistManager:PlaylistManager
    var songStreamer:AVPlayer?
    
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
            } else {
                songStreamer!.play()
            }
        } else {
            playNewSong(playlistManager.currentSong)
        }
    }
    func playNewSong(song:Song){
        let songURL = NSURL(string: song.URL )
        if let playerItem = AVPlayerItem(URL: songURL) {
            if childViewControllers.count > 0 {
                if let playerView = childViewControllers[0] as? SongViewController {
                    playerView.infoFromSong(song)
                }
            }
            songStreamer = AVPlayer(playerItem: playerItem)
            songStreamer!.play()
        } else {
            NSLog("Error parsing song URL")
        }
    }
}

