//
//  DetailPageViewModel.swift
//  ToDoApp
//
//  Created by Seher Köse on 13.08.2023.
//

import Foundation

class DetailPageViewModel{
    
    var nrepo = NotesDaoRepository()
    
    func guncelle(note_id:Int, note_name: String){
        nrepo.guncelle(note_id: note_id, note_name: note_name)
    }
}
