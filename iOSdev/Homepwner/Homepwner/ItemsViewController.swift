//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Cecilia  Villatoro on 5/4/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController{
    var itemStore: ItemStore!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemStore.allItems.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom:  0 ,right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    @IBAction func addNewItem(sender: AnyObject){
        //
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.indexOf(newItem){
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }

    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle : UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete{
            let item = itemStore.allItems[indexPath.row]
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message : message, preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: { (action) -> Void in

            //remove the item from the item store
            self.itemStore.removeItem(item)
            //remove row from table view with animation
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            })
        ac.addAction(deleteAction)

        //present the alert controller
        presentViewController(ac, animated: true, completion: nil)
        }
        

        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // if the triggered segue is the showitem segue
        if segue.identifier == "showItem"{
            //figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row{
                let item = itemStore.allItems[row]
                let detailViewController = segue.destinationViewController as! DetailViewController
                detailViewController.item = item
            }
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
        
        
    }
    
    
    @IBAction func toggleEditingMode(sender: AnyObject){
        if editing{
            sender.setTitle("Edit", forState: .Normal)
            setEditing(false, animated: true)
        }
        else{
            sender.setTitle("Done", forState: .Normal)
            setEditing(true, animated: true)
        }
        
    }
}
