//
//  ToDoList.swift
//  ToDo
//
//  Created by cssummer16 on 6/12/16.
//  Copyright © 2016 cssummer16. All rights reserved.
//

import Foundation


class ToDoList {
    
    var name = ""
    var list = [ToDoItem]()
    var repeatInterval = "" //Later maybe make better specifications for this
    var gapItem = true //maybe make false later?
    
    init(name: String, repeatInterval: String) { //ADD MORE LATER!!!
        self.name = name
        self.repeatInterval = repeatInterval
    }
    
    func getName() -> String {
        return name
    }
    
    func getList() -> [ToDoItem] {
        return list
    }
    
    func addItem(newItem: ToDoItem) {
        list.append(newItem)
    }
    
    
    
    
    
}
