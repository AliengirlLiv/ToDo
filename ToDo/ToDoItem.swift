//
//  ToDoItem.swift
//  ToDo
//
//  Created by cssummer16 on 6/12/16.
//  Copyright © 2016 cssummer16. All rights reserved.
//

import Foundation

class ToDoItem {
    
    var description = ""
    var categories = [String]()
    var repeated =  false
    var completion = 0.0
    var daily = false
    
    init(setDescription: String, setCategories: [String], setRepeated: Bool){
        categories = setCategories
        repeated = setRepeated
        description = setDescription //add more later
    }
    
    
    func getDescription() -> String {
        return description
    }
    
    func getCategories() -> [String] {
        return categories
    }
    
    
    func getRepeated() -> Bool {
        return repeated
    }
    
    
    func getCompletion() -> Double {
        return completion
    }
    
    
    func getDaily() -> Bool {
        return daily
    }
    
    
    //ADD SETTER FUNCTIONS LATER!!!
    
    
}

