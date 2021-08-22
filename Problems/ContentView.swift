//
//  ContentView.swift
//  Problems
//
//  Created by Timur Rakov on 31.07.2021.
//

import SwiftUI

struct Problem: Identifiable {
    var id = UUID()
    var name: String
}

struct Row: View {
    var problem: Problem
    var body: some View {
        Text(problem.name)
    }
}

struct ContentView: View {
    let problems = [
        Problem(name: "1"),
        Problem(name: "2"),
        Problem(name: "3"),
        Problem(name: "40")
    ]
    var body: some View {
        VStack {
            Button("Test") {
                NumberOfIslands().tests()
            }.padding()
            List(problems) {
                Row(problem: $0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
