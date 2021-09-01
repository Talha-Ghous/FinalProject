//
//  DrawerViewController.swift
//  AutomateProto
//
//  Created by Muneeb Ahmad on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class DrawerViewController: UITableViewController {

    struct Item {
        var title: String;
        let image: String;
    }
    
    struct Section {
        let name: String;
        var items: [Item];
    }
    
    let advancedItems = [
        Item(title: "About", image: "ic_about.png"),
        Item(title: "Account", image: "ic_account.png"),
        Item(title: "Settings", image: "ic_settings.png")
    ];
    
    var sections = [Section]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sections = [
            Section(name: "Advance Options", items: advancedItems)
        ];
        
        tableView.tableFooterView = UIView();
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count;
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].name;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections[section].items.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DrawerCell = tableView.dequeue(forIndexPath: indexPath) as DrawerCell;
        cell.lblTitle.text = sections[indexPath.section].items[indexPath.row].title;
        cell.ivThumb.image = UIImage(named: sections[indexPath.section].items[indexPath.row].image);
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (Director.getInstance().drawerAdatper != nil) {
            switch indexPath.row {
            case 0:
                Director.getInstance().drawerAdatper?.onAbout();
                break;
            case 1:
                Director.getInstance().drawerAdatper?.onAccount();
                break;
            case 2:
                Director.getInstance().drawerAdatper?.onSettings();
                break;
            default:
                break;
            }
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

}/** end class. */
