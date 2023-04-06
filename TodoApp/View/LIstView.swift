//
//  ListView.swift
//  TodoApp
//
//  Created by dasom kim on 2023/03/22.
//

import SwiftUI

struct ListView: View {
    
    @State var todos: [String] = ["What is your goal?", "Let's Write"]
    
    var body: some View {
        List{
            ForEach(todos, id: \.self){ todo in
                ListRowView(todoTitle: todo)
            }
        }
            .padding(.top, 5)
            .background(Color("navbarColor"))

        .navigationTitle("Todo List")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("navbarColor"), for: .navigationBar)
            .toolbar{
                Button {
                    print("dd")
                } label: {
                    Image(systemName: "scissors")
                        .font(.system(size: 15))
                        .scaledToFit()
                        .frame(width: 17)
                }
                
                Button {
                    print("dd")
                } label: {
                    Image(systemName: "plus.circle" )
                        .frame(width: 17)
                        .scaledToFit()
                        .padding(.trailing, 10)


                }

            }

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView()
        }
    }
}
