//
//  Prospect.swift
//  ToDolist
//
//  Created by Armaan Khan  on 17/08/24.
//

import SwiftData
import Foundation

@Model
class Prospect {
    var task: String
    var date: Date
    var time: Date
    var lists: String
    
    init(task: String, date: Date, time: Date, lists: String) {
        self.task = task
        self.date = date
        self.time = time
        self.lists = lists
    }
}
