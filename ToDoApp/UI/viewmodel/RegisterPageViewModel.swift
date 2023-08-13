//
//
//  ToDoApp
//
//  Created by Seher Köse on 13.08.2023.
//

import Foundation

class RegisterPageViewModel{
    var nrepo = NotesDaoRepository()
    
    func register(note_name:String){
        nrepo.register(note_name: note_name)
    }
}
