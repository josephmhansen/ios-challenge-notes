//
//  Note.swift
//  Notes
//
//  Created by Joseph Hansen on 7/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Note: Equatable {
    private let kNoteBody = "noteBodyKey"
    
    var dictionaryCopy: [String: AnyObject] {
        return [kNoteBody: noteBody]
    }
    
    
    
    var noteBody: String
    
    init(noteBody: String) {
        self.noteBody = noteBody
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let noteBody = dictionary[kNoteBody] as? String else{
            return nil
        }
        
        self.noteBody = noteBody
        
    }
    
    
}

func == (lhs: Note, rhs: Note) -> Bool {
    return lhs.noteBody == rhs.noteBody
}


