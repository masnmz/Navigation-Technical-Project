//
//  ContentView.swift
//  Navigation Technical Project
//
//  Created by Mehmet Alp Sönmez on 05/06/2024.
//

import SwiftUI

struct DetailView : View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to some random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
