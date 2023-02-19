//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Philip Keller on 2/17/23.
//

import SwiftUI

struct ToDoListView: View {
    @State private var SheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo.item)
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("To Do List")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        SheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }


                }
            }
            .sheet(isPresented: $SheetIsPresented) {
                NavigationStack{
                    DetailView(toDo: ToDo(), newToDo: true) // new value
                }
            }
//            .fullScreenCover(isPresented: $SheetIsPresented) {
//                DetailView(passedValue: "")
//            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())
    }
}


