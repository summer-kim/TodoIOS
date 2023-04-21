//
//  itemModel.swift
//  TodoApp
//
//  Created by dasom kim on 2023/04/08.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let solved: Bool
    
    init(id: String = UUID().uuidString, title: String, solved: Bool) {
        self.id = id
        self.title = title
        self.solved = solved
    }
    
    func updateTodo() -> ItemModel {
        return ItemModel(id: id, title: title, solved: !solved)
    }
}
