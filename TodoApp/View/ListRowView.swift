//
//  ListRowView.swift
//  TodoApp
//
//  Created by dasom kim on 2023/04/06.
//

import SwiftUI

struct ListRowView: View {
    
    var todoTitle: String = ""
    
    var body: some View {
        HStack{
            Text(todoTitle)
            Spacer()
            Image(systemName: "heart")

        }.padding(.vertical, 10)
       
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView()
    }
}
