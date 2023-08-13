//
//  HomePageViewModel.swift
//  ToDoApp
//
//  Created by Seher Köse on 13.08.2023.
//

import Foundation
import RxSwift

class HomePageViewModel{
    
    var nrepo = NotesDaoRepository()
    
    var noteList = BehaviorSubject<[Notes]>(value: [Notes]())
    
    init(){
        noteList = nrepo.noteList
    }
    
    func sil(note_id:Int){
        nrepo.sil(note_id: note_id)
        notlariYukle()
    }
    
    func ara(aramaKelimesi:String){
        nrepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func notlariYukle(){
        nrepo.notlariYukle()
    }
    
}
