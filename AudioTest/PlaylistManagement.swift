//
//  PlaylistManagement.swift
//  AudioTest
//
//  Created by Scott Krulcik on 2/27/15.
//  Copyright (c) 2015 Scott Krulcik. All rights reserved.
//

import Foundation

struct Song {
    var URL:String
    var albumArtURL:String?
    var artist:String
    var title:String
    var album:String
}

struct Playlist {
    var songs:Array<Song>
}

class PlaylistManager {
    // Handle song index internally to prevent unsafe access
    private var playlistPosition:Int
    
    var playlist:Playlist
    var currentSong:Song {
        get {
            return playlist.songs[playlistPosition]
        }
    }
    
    init(){
        playlist = PlaylistManager.defaultPlaylist()
        playlistPosition = 0
    }
    
    class func defaultPlaylist() -> Playlist {
        let urlBase:String = "http://www.andrew.cmu.edu/user/skrulcik/rsc/"
        let albumURLBase:String = "http://www.andrew.cmu.edu/user/skrulcik/img/"
        let A:Song = Song(URL: urlBase + "01_Love_Me_Again.mp3",
            albumArtURL: albumURLBase + "LoveMeAgain.jpg",
            artist: "John Newman",
            title: "Love Me Again",
            album: "Single")
        let B:Song = Song(URL: urlBase + "02_Paris.mp3",
            albumArtURL: albumURLBase + "YouAreHere.jpg",
            artist: "Magic Man",
            title: "Paris",
            album: "You Are Here")
        let C:Song = Song(URL: urlBase + "04_Electric_Feel.mp3",
            albumArtURL: albumURLBase + "OracularSpectacular.jpg",
            artist: "MGMT",
            title: "Electric Feel",
            album: "Oracular Spectacular")
        return Playlist(songs: [B, A, C])
    }
    
    //MARK: Song Navigation
    func forward() {
        playlistPosition = (playlistPosition + 1) % playlist.songs.count
    }
    func backwards() {
        playlistPosition = (playlistPosition - 1) % playlist.songs.count
    }
    
}