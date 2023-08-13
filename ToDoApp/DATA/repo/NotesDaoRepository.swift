//
//  ToDoApp
//
//  Created by Seher Köse on 13.08.2023.
//

import Foundation
import RxSwift

class NotesDaoRepository{
    
    var noteList = BehaviorSubject<[Notes]>(value: [Notes]())
    
    func register(note_name: String){
        print("Not kaydet : \(note_name)")
    }
    
    func guncelle(note_id:Int, note_name: String){
        print("Not güncelle: \(note_id) - \(note_name)")
        
    }
    
    func sil(note_id:Int){
        print("Notu Sil: \(note_id)")
    }
    
    func ara(aramaKelimesi:String){
        print("Not ara: \(aramaKelimesi)")
    }
    
    func notlariYukle(){
        
        var nList = [Notes]()

        let n1 = Notes(note_id: 1, note_name: "Birthday", note_date: "25/06/1999")
        let n2 = Notes(note_id: 1, note_name: "Bucket List", note_date: "05/09/2023")
        let n3 = Notes(note_id: 1, note_name: "Deadline", note_date: "07/09/2023")
        
        nList.append(n1)
        nList.append(n2)
        nList.append(n3)
        noteList.onNext(nList) //Tetikleme
    }
    
}
