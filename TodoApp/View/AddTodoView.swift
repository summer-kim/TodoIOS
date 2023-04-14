//
//  AddTodoView.swift
//  TodoApp
//
//  Created by dasom kim on 2023/04/06.
//

import SwiftUI

struct AddTodoView: View {
    
    @EnvironmentObject var todos: TodoModel
    @Environment(\.dismiss) var dismiss
    @State var TextFieldVar: String = ""
    
    @State var alertMessage: String = ""
    @State var alertIsOn: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                TextField("ex) Posting on Instagram", text: $TextFieldVar)
                    .frame(height: 55)
                    .padding(.horizontal,10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                
                Button( action: addTodoFunc,
                label: {
                    Text("save".uppercased())
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color("navbarColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(12)

                })

            }.padding(14)
        }
            .navigationTitle("Add Todo")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color("navbarColor") ,for: .navigationBar)
            .alert(isPresented: $alertIsOn, content: getAlert)
      
    }
    
    func addTodoFunc(){
        if isAppropriate() {
            todos.addTodo(title: TextFieldVar)
            dismiss()
        }
    }
    
    func isAppropriate() ->Bool{
        if TextFieldVar.count < 3{
            alertMessage = "Write more than 3 characters!💖"
            alertIsOn = true
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
    
    
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddTodoView()
        }.environmentObject(TodoModel(Todos: []))
    }
}
