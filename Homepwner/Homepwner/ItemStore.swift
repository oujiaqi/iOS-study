//
//  ItemStore.swift
//  Homepwner
//
//  Created by ouou on 2017/9/11.
//  Copyright © 2017年 colinou. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    
    init() {
        for _ in 0..<20 {
            let _ = createItem()
        }
    }
    
    func createItem() -> Item {
        let newItem = Item(random : true)
        allItems.append(newItem)
        return newItem
    }
}
