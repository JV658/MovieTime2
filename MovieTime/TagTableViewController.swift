//
//  TagTableViewController.swift
//  MovieTime
//
//  Created by Cambrian on 2023-03-15.
//

import UIKit
import CoreData

class TagTableViewController: UITableViewController {
    
    var persistentContainer: NSPersistentContainer!
    var tagList = [Tag]()
    
    @IBAction func addTag(_ sender: Any) {
        let alert = UIAlertController(title: "Add Tag", message: "Please enter the name of your tag", preferredStyle: .alert)
        
        alert.addTextField{
            (textfield) in
            textfield.text = "tag name"
        }
        
        let alertOK = UIAlertAction(title: "Save", style: .default){ [self] _ in
            let textfield = alert.textFields![0]
            
            let tag = Tag(context: persistentContainer.viewContext)
            tag.name = textfield.text
            
            try! persistentContainer.viewContext.save()
            
            tableView.reloadData()
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(alertOK)
        alert.addAction(alertCancel)
        
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let request: NSFetchRequest<Tag> = Tag.fetchRequest()
        let moc = persistentContainer.viewContext
        
        guard
            let results = try? moc.fetch(request)
        else {return}
        
        tagList = results
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tagList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell", for: indexPath)

        cell.textLabel!.text = tagList[indexPath.row].name

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
