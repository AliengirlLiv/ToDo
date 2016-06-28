//
//  AllLists.swift
//  ToDo
//
//  Created by cssummer16 on 6/12/16.
//  Copyright © 2016 cssummer16. All rights reserved.
//

import UIKit
import Firebase

class AllLists: UITableViewController {
    
    //var categories = [ToDoList]()
    var listNames = [String]()
    let ref = FIRDatabase.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("running viewDidLoad")
        login()
        title = "All Lists"
        print("why isn't this working???")

        
        
            if let user = FIRAuth.auth()?.currentUser {
                print("got the user")
                let allListsRef = self.ref.child("users/\(user.uid)/listNames")
                allListsRef.observeEventType(FIRDataEventType.ChildAdded, withBlock: { (snapshot) in
                    let listName = snapshot.key //as? [String : AnyObject]
                    self.listNames.append(listName)
                    self.tableView.reloadData()
                    }
                )
            } else {
                print ("What happened to the user!  She disappeared!!!")
            }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addNewList))
        
    }
    
    
    
    
    
    func login() {
        
        
        FIRAuth.auth()?.signInWithEmail("liv@gmail.com", password:"123456", completion: {
            user, error in
            if error != nil{
                print("Entered incorrectly! Are you an imbicile?")
            } else {
                print ("logged in as")
                FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
                    if let user = user {
                        print (user)
                    } else {
                        print ("where's the user")
                    }
                }
            }
        })
    }
    
    
    
    
    
    
    func addNewList () {
        let alertController = UIAlertController(title: "Create New List", message: "", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler(nil)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "OK", style: .Default){ [unowned self, alertController] _ in
            let name = alertController.textFields![0].text!
            
            let user = FIRAuth.auth()?.currentUser
            if let user = user {
                let uid = user.uid
                self.ref.child("users/\(uid)/listNames").updateChildValues([name: true])
            }
            self.listNames.append(name)
            self.tableView.reloadData()
            })
        presentViewController(alertController, animated: true, completion: nil)
    }

    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNames.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("allListsCell", forIndexPath: indexPath)
        let currListName = listNames[indexPath.row]
        cell.textLabel!.text = currListName
        return cell
    }
    

    
    
    // MARK: - Navigation
    
    //  In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seeList" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                if let destination = segue.destinationViewController as? List {
                    //destination.list = categories[indexPath.row]
                    destination.listName = listNames[indexPath.row]
                }
            }
        }
        

    }
    
    
}
