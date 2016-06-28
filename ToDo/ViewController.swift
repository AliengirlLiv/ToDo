//
//  ViewController.swift
//  ToDo
//
//  Created by cssummer16 on 6/12/16.
//  Copyright © 2016 cssummer16. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    
    
  
    
    
    @IBAction func okayButton(sender: UIButton) {
    }
    
    
    
    
    @IBOutlet weak var okayCancel: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
       // let tapGesture = UITapGestureRecognizer(target: self, action: "tap:")
       // view.addGestureRecognizer(tapGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //self.view.endEditing(true)
        print("method got called!!!")
        return false
    }
    
    func tap(gesture: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }



}

