//
//  DetailPage.swift
//  ToDoApp
//
//  Created by Seher Köse on 1.08.2023.
//

import UIKit

class DetailPage: UIViewController {

    
    @IBOutlet weak var noteNameDetail: UITextView!
    
    @IBOutlet weak var guncelleButton: UIButton!
    var note:Notes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteNameDetail.layer.cornerRadius = 20
        guncelleButton.layer.cornerRadius = 20
        
        
        if let n = note{
            noteNameDetail.text = n.note_name
        }

    }

    @IBAction func guncelleButtonAct(_ sender: Any) {
        if let nn = noteNameDetail.text, let n = note {
            guncelle(note_id: n.note_id!, note_name: nn)
        }
    }

    
    func guncelle(note_id:Int, note_name: String){
        print("Not güncelle: \(note_id) - \(note_name)")
        
    }
    
}



