//
//  SongViewController.swift
//  AudioTest
//
//  Created by Scott Krulcik on 2/27/15.
//  Copyright (c) 2015 Scott Krulcik. All rights reserved.
//

import UIKit


class SongViewController:UIViewController {
    
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
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