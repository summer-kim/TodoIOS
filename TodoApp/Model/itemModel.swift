//
//  itemModel.swift
//  TodoApp
//
//  Created by dasom kim on 2023/04/08.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    var solved: Bool = false
}
