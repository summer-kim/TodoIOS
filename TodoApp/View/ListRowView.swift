//
//  ListRowView.swift
//  TodoApp
//
//  Created by dasom kim on 2023/04/06.
//

import SwiftUI

struct ListRowView: View {
    
    var todo: ItemModel

    var body: some View {
        HStack{
            Text(todo.title)
            Spacer()
            Image(systemName: todo.solved ? "heart.fill" : "heart")
                .foregroundColor(todo.solved ? Color("heartColor") : nil)
        }.padding(.vertical, 10)
       
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ListRowView(todo: ItemModel(title: "This is firstTodo", solved: true))
            ListRowView(todo: ItemModel(title: "This is secondTodo", solved: false))
        }
       // .previewLayout(.sizeThatFits)

        
    }
}
