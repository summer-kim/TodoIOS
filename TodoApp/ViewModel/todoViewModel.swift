//
//  todoViewModel.swift
//  TodoApp
//
//  Created by dasom kim on 2023/04/10.
//

import Foundation

class TodoModel: ObservableObject {
    
    @Published var Todos: [ItemModel] = []{
        didSet{
            saveTodo()
        }
    }
    let secretKey: String = "secretKey"
    
    init(Todos: [ItemModel]) {
        getTodo()
    }
    
    
    
    func getTodo() {
//        let todoSample: [ItemModel] = [
//            ItemModel(title: "What is your Goal?", solved: false)
//            ,ItemModel(title: "This is solved", solved: true)
//        ]
//        Todos.append(contentsOf: todoSample)
        guard
            let data = UserDefaults.standard.data(forKey: secretKey),
            let savedTodo = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.Todos = savedTodo
    }
    
    func deleteTodo(IndexSet: IndexSet) {
        Todos.remove(atOffsets: IndexSet)
    }
    
    func moveTodo(IndexSet:IndexSet, to:Int){
         Todos.move(fromOffsets: IndexSet, toOffset: to)
     }
    
    func addTodo(title: String){
        let newTodo = ItemModel(title: title, solved: false)
        Todos.append(newTodo)
    }
    
    func checkTodo(todo: ItemModel){
        //        if let indexNum = Todos.firstIndex(where: { (item) -> Bool in
        //            return todo.id == item.id
        //        }){
        //            run this code
        //        }
        if let indexNum = Todos.firstIndex(where: {$0.id == todo.id}){
            Todos[indexNum] = todo.updateTodo()
        }
    }
    
    func saveTodo(){
        if let encodedData = try? JSONEncoder().encode(Todos){
            UserDefaults.standard.set(encodedData, forKey: secretKey)
        }
    }
}
