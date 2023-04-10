//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by dasom kim on 2023/03/22.
//

import SwiftUI

/*
 
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manage Models for View
 
 */

@main
struct TodoAppApp: App {
    
    @StateObject var todoViewModel: TodoModel = TodoModel(Todos: [])

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(todoViewModel)
        }
        
    }
}
