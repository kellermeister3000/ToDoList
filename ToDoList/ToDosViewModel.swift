//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Philip Keller on 2/18/23.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        // Temp Data here. Will eventually load in saved data
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World!"))
                     
    }
}
