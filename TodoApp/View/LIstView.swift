//
//  ListView.swift
//  TodoApp
//
//  Created by dasom kim on 2023/03/22.
//

import SwiftUI

struct ListView: View {
    
    @State var todos: [ItemModel] = [
        ItemModel(title: "What is your goal?")
        ,ItemModel(title: "Let's Write")
    ]
    
    var body: some View {
        List{
            ForEach(todos){ todo in
                ListRowView(todo: todo)
            }
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
    }
}
