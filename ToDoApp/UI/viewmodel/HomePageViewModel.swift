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
        veritabaniKopyala()
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
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDo", ofType: ".sqlite")
        
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDo.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path()){
            print("Veritabanı zaten var")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        
        
        
    }
    
}
