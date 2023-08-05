//
//  Notes.swift
//  ToDoApp
//
//  Created by Seher Köse on 2.08.2023.
//

import Foundation
class Notes{
    
    var note_id:Int?
    var note_name:String?
    var note_date: String
    
  
    
    init(note_id: Int, note_name: String, note_date: String) {
        self.note_id = note_id
        self.note_name = note_name
        self.note_date = note_date
        
   
    }
    
    
}
