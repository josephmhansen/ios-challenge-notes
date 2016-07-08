//
//  NoteController.swift
//  Notes
//
//  Created by Joseph Hansen on 7/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    private let notesKey = "notes"
    
    static let sharedController = NoteController()
    
    var notes: [Note] = []
    
    init() {
        loadFromPersistentStorage()
    }
    
    func addNote(note: Note) {
        notes.append(note)
        saveToPersistentStorage()
    }
    
    func removeNote(note: Note) {
        if let index = notes.indexOf(note){
            notes.removeAtIndex(index)
            saveToPersistentStorage()
            
        }
    }
    
    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(notes.map{$0.dictionaryCopy}, forKey: notesKey)
        
    }
    
    func loadFromPersistentStorage() {
        guard let noteDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(notesKey) as? [[String: AnyObject]] else{
            return
        }
        notes = noteDictionaryArray.flatMap{Note(dictionary:$0)}
        
    }
    
    
}
