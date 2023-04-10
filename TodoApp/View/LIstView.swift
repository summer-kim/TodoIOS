//
//  ListView.swift
//  TodoApp
//
//  Created by dasom kim on 2023/03/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var todos: TodoModel
    
    var body: some View {
        List{
            ForEach(todos.Todos){ todo in
                ListRowView(todo: todo)
            }
            .onDelete(perform: todos.deleteTodo)
            .onMove(perform: todos.moveTodo)
        }
            .padding(.top, 5)
          //  .background(Color("navbarColor"))
            .listStyle(PlainListStyle())

        .navigationTitle("Todo List")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("navbarColor"), for: .navigationBar)
  
        .navigationBarItems(
            leading: EditButton()
            ,trailing:
                NavigationLink {
                    AddTodoView()
                } label: {
                    Image(systemName: "plus.circle" )
                        .frame(width: 17)
                        .scaledToFit()
                        .padding(.trailing, 10)

                }
        )        
    }
    
                      

}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(TodoModel(Todos: []))
    }
}
