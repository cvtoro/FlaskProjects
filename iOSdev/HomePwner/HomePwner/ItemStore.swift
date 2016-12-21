//
//  ItemStore.swift
//  Homepwner
//
//  Created by Cecilia  Villatoro on 5/4/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
class ItemStore{
    var allItems = [Item]()
    
    
    func createItem() -> Item{
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(item: Item){
        if let index = allItems.indexOf(item){
            allItems.removeAtIndex(index)
        }
    }
   
    func moveItemAtIndex(fromIndex: Int, toIndex: Int){
        if fromIndex == toIndex{
            return
        }
        //get a reference to the item
        let movedItem = allItems[fromIndex]
        //remove the item
        allItems.removeAtIndex(fromIndex)
        //reinsert at specified postion
        allItems.insert(movedItem, atIndex:  toIndex)
    }
}
