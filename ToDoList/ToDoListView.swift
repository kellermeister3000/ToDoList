//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Philip Keller on 2/17/23.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<100, id: \.self) { number in
                    NavigationLink {
                        DetailView(passedValue: "Item \(number+1)")
                    } label: {
                        Text("Item \(number+1)")
                    }
                }
            }
            .navigationTitle("School Year")
            .listStyle(.plain)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


