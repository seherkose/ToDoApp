//
//  ViewController.swift
//  ToDoApp
//
//  Created by Seher Köse on 1.08.2023.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var notlarTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var notlarListesi = [Notes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        notlarTableView.delegate = self
        notlarTableView.dataSource = self
        
       let n1 = Notes(note_id: 1, note_name: "Doğum Günü", note_date: "25/06/1999")
       let n2 = Notes(note_id: 1, note_name: "Alınacaklar Listesi", note_date: "05/09/2023")
       let n3 = Notes(note_id: 1, note_name: "Ödev Deadline", note_date: "07/09/2023")
        
        notlarListesi.append(n1)
        notlarListesi.append(n2)
        notlarListesi.append(n3)
    
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
extension HomePage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print ("NOT ARA: \(searchText)")
    }
    
}
extension HomePage: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notlarListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "notlarHucre") as! NotHucre
        
        cell.notBaslik.text = note.note_name
        cell.notTarih.text = note.note_date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notlarListesi[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: note)
        //Seçilmiş animasyonunu kaldırır
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {contexualAction,view,bool in
            let note = self.notlarListesi[indexPath.row]
           
            
            let alert = UIAlertController(title: "SİLME İŞLEMİ", message: "\(note.note_name!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
                print("Not Sil: \(note.note_id!)")
                
            }
            
            alert.addAction(evetAction)
            self.present(alert, animated: true)

        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
 
}

