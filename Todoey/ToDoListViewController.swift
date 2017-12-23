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
    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogoron"]

    
    //---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }//..End viewDidLoad
    
    
    //MARK: - Tableview Datasource Methods
    
    
    // Set number of rows for the tableView
    //--------------------------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }//..END tableView
    
    
    // Ask the data source for a cell to insert in a particular location in the tableView
    // Thi is load and re-load data into the tableView
    //-------------------------------------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        //Testing~~~~~print("I am in Load & Re-Load Data")
        return cell
    }//..End tableView
    
    
    //MARK: - Tableview Delegate Methods
    
    
    // tells the delegate that the specified row is now selected
    //-------------------------------------------
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Testing~~~~~print(itemArray[indexPath.row])
        // toggles the checkmark of the selected row
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        // makes the backgroud of the selected row back to white (not gray)
        tableView.deselectRow(at: indexPath, animated: true)
    }//..End tableView
    
    
    //MARK: - Add New Items
    
    
    //----------------------------------------------------------
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // create a local var textField and initialize it to be an emply UITextField
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        //user clicks the Add Item button on the UIAlert dialog and consequently the code in the closure below executes
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //Testing~~~~~print(textField.text)
            // self is needed to access the global var itemArray from within this closure
            // ! forces the unwrap which means the text will never be nil (even if it's empty, it will be assigned to an empty string). Alternatively we could have had: self.itemArray.append(textField.text ?? "New Item") which means if the text is nil then assign "New Item" to it
            self.itemArray.append(textField.text!)
            // re-load the data into tableView
            self.tableView.reloadData()
        }//..
        // add a textField to the Alert. Note: the code in the closure below executes once the textField is added to the Alert (and not when the user enters some text in the testField)
        alert.addTextField { (alertTextField) in
            // show an initial defualt gray text in the textField
            alertTextField.placeholder = "Enter new item"
            // this is the way to extend the scope of the alertTextField to the entire function here
            textField = alertTextField
        }//..
        // add an action button to the Alert
        alert.addAction(action)
        // show the Alert
        present(alert, animated: true, completion: nil)
        
        
    }//..End addButtonPressed
    
    
}//..End ToDoListViewController class

