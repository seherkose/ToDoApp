//
//  ToDoApp
//
//  Created by Seher Köse on 13.08.2023.
//

import Foundation
import RxSwift

class NotesDaoRepository{
    
    var noteList = BehaviorSubject<[Notes]>(value: [Notes]())
    
    let db:FMDatabase?
    
    init(){
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func register(note_name: String){
        //print("Not kaydet : \(note_name)")
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO notlar (note_name) VALUES(?)", values: [note_name])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(note_id:Int, note_name: String){
        //print("Not güncelle: \(note_id) - \(note_name)")
        db?.open()
        do{
            try db!.executeUpdate("UPDATE notlar SET note_name = ? WHERE note_id = ?", values: [note_name,note_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
    func sil(note_id:Int){
        //print("Notu Sil: \(note_id)")
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM notlar WHERE note_id = ?", values: [note_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi:String){
        //print("Not ara: \(aramaKelimesi)")
        
        db?.open()
        var nList = [Notes]()
        
        do{
            //notlar=sqlite'da oluşturulan toDo dosyasındaki tablo adı
            let result = try db!.executeQuery("SELECT * FROM notlar WHERE note_name like '%\(aramaKelimesi)%'", values: nil)
            while result.next(){
                let note_id = Int(result.string(forColumn: "note_id"))!
                let note_name = result.string(forColumn: "note_name")!
                
                let notes = Notes(note_id: note_id, note_name: note_name)
                nList.append(notes)
                
            }
            noteList.onNext(nList) //Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func notlariYukle(){
        db?.open()
        var nList = [Notes]()
        
        do{
            //notlar=sqlite'da oluşturulan toDo dosyasındaki tablo adı
            let result = try db!.executeQuery("SELECT * FROM notlar", values: nil)
            while result.next(){
                let note_id = Int(result.string(forColumn: "note_id"))!
                let note_name = result.string(forColumn: "note_name")!
                
                let notes = Notes(note_id: note_id, note_name: note_name)
                nList.append(notes)
                
            }
            noteList.onNext(nList) //Tetikleme
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
}
