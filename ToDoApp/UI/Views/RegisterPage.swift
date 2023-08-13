//
//  KayitSayfa.swift
//  ToDoApp
//
//  Created by Seher Köse on 1.08.2023.
//

import UIKit

class RegisterPage: UIViewController {
    
    var viewModel = RegisterPageViewModel()

    
    @IBOutlet weak var noteName: UITextView!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteName.layer.cornerRadius = 20
        registerButton.layer.cornerRadius = 20
        
    }
    
    @IBAction func registerButtonAct(_ sender: Any) {
        if let nn = noteName.text {
            viewModel.register(note_name: nn)
        }

    }

}


