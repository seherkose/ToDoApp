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
    var viewModel = HomePageViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        notlarTableView.delegate = self
        notlarTableView.dataSource = self
        
        _ = viewModel.noteList.subscribe(onNext: { nList in
            self.notlarListesi = nList
            self.notlarTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.notlariYukle()
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
        //print ("NOT ARA: \(searchText)")
        viewModel.ara(aramaKelimesi: searchText)
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
        //cell.notTarih.text = note.note_date
        
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
                //print("Not Sil: \(note.note_id!)")
                self.viewModel.sil(note_id: note.note_id!)
            }
            
            alert.addAction(evetAction)
            self.present(alert, animated: true)

        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
 
}

