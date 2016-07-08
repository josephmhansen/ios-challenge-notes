//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Joseph Hansen on 7/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    @IBOutlet weak var noteBodyText: UITextView!
    
    var note: Note?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let note = self.note {
            note.noteBody = self.noteBodyText.text
        } else {
            let newNote = Note(noteBody: self.noteBodyText.text)
            NoteController.sharedController.addNote(newNote)
            self.note = newNote
        }
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
