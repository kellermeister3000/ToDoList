//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Philip Keller on 2/17/23.
//

import SwiftUI

struct ToDoListView: View {
    @State private var SheetIsPresented = false
    
    var toDos = ["Learn Swift",
                 "Build Apps",
                 "Change the World",
                 "Bring the Awesome",
                 "Take a Vaction"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
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
                    DetailView(passedValue: "")
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
    }
}


