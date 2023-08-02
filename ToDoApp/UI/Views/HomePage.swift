//
//  ViewController.swift
//  ToDoApp
//
//  Created by Seher Köse on 1.08.2023.
//

import UIKit

class HomePage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonDetay(_ sender: Any) {
        
        let note = Notes(note_id: 1, note_name: "Watch 10 video")
        performSegue(withIdentifier: "toDetail", sender: note)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let note = sender as? Notes{
                let gidilecekVC = segue.destination as! DetailPage
                gidilecekVC.note = note
                
            }

        }
    }


}

