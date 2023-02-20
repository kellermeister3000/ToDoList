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
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDosVM.toggleCompleted(toDo: toDo)
                            }
                        
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                    .font(.title2)
                    }
                }
                // Shorthand calls to .onDelete and .onMove here
                .onDelete(perform: toDosVM.deleteToDo)
                .onMove(perform: toDosVM.moveToDo)
                
                // Traditional calls to .onDelete and .onMove here
//                .onDelete { indexSet in
//                    toDosVM.delete(indexSet: indexSet)
//                }
//                .onMove { fromOffsets, toOffset in
//                               toDosVM.move(fromOffsets: fromOffsets, toOffset: toOffset)
//                }
            }
            .navigationTitle("To Do List")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
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
                    DetailView(toDo: ToDo()) // new value
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


