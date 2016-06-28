//
//  AddNewItem.swift
//  ToDo
//
//  Created by cssummer16 on 6/12/16.
//  Copyright © 2016 cssummer16. All rights reserved.
//

import UIKit
import Firebase


class AddNewItem: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var repeatedSwitch: UISwitch!
    var list: ToDoList?
    let ref = FIRDatabase.database().reference()
    
    
    
    @IBAction func saveClicked(sender: AnyObject) {
        
        let user = FIRAuth.auth()?.currentUser
        if let user = user {
            let uid = user.uid
            let newItemData = ["description": textField.text!,
                                "repeated": repeatedSwitch.on]
            print("here's the list")
            print (list)
            let key = ref.child("users/\(uid)/actualLists/\(list!.getName())/listItems").childByAutoId().key
            let childUpdates = ["users/\(uid)/actualLists/\(list!.getName())/listItems/\(key)": newItemData]
            ref.updateChildValues(childUpdates)
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("method got called!!!")
        return false
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
