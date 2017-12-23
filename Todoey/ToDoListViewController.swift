//
//  ViewController.swift
//  Todoey
//
//  Created by DAVID MANN on 12/22/17.
//  Copyright © 2017 DAVID MANN. All rights reserved.
//

import UIKit


//---------------------------------------------------
class ToDoListViewController: UITableViewController {
    let itemArray = ["Find Mike", "Buy Eggos", "Destory Demogoron"]

    
    //---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }//End viewDidLoad
    
    
    //MARK: - Tableview Datasource Methods
    
    
    // Set number of rows for the tableView
    //--------------------------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }//END tableView
    
    
    // Ask the data source for a cell to insert in a particular location in the table view
    //-------------------------------------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }//End tableView
    
    
    //MARK: - Tableview Delegate Methods
    
    
    // tells the delegate that the specified row is now selected
    //-------------------------------------------
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Testing.....print(itemArray[indexPath.row])
        // toggles the checkmark of the selected row
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        // makes the backgroud of the selected row back to white (not gray)
        tableView.deselectRow(at: indexPath, animated: true)
    }//End tableView
    
    
    
}//End ToDoListViewController class

