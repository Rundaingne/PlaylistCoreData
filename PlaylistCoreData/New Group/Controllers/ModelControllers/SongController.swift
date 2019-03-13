//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Brooke Kumpunen on 3/13/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

class SongController {
    
    
    //MARK: Singleton

    //MARK: Source of truth. Stored in playlists.
    
    //MARK: CRUD:
    static func createSong(songWithTitle title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.shared.saveToPersistence()
    }
    
    static func deleteSong(songToDelete: Song) {
        CoreDataStack.context.delete(songToDelete)
        PlaylistController.shared.saveToPersistence()
    }
    
    //MARK: Other functions
}
