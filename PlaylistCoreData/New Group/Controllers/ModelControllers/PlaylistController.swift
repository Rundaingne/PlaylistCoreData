//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Brooke Kumpunen on 3/13/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    
    //MARK: Singleton
    static let shared = PlaylistController()
    
    //MARK: Source of truth. This will be the MOC
    var playlists: [Playlist] {
        //Grabs playlists off of hard drive
        var request = NSFetchRequest<Playlist>()
            request = Playlist.fetchRequest()
        //Deal with the throw
        return(try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    
    //MARK: CRUD:
    func createPlaylist(playlistWithTitle title: String) {
        Playlist(title: title)
        saveToPersistence()
    }
    
    func deletePlaylist(playlistToDelete: Playlist) {
        CoreDataStack.context.delete(playlistToDelete)
        saveToPersistence()
    }
    
    //MARK: Other functions
    
    //MARK: Persistence
    func saveToPersistence() {
        do {
           try CoreDataStack.context.save()
        } catch {
            print("Error saving. \(error): \(error.localizedDescription)")
        }
    }
}
