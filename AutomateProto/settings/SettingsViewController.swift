//
//  SettingsViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 23/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    struct item {
        let name: String;
        let image: String;
    }
    
    let items: [item] = [item(name: "About", image: "ic_about.png"),
    item(name: "Account Settings", image: "ic_account.png")];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings";
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true;
        }
        
        let buttClose = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(SettingsViewController.onCloseButtonClicked));
        self.navigationItem.rightBarButtonItem = buttClose;
        
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SettingsViewCell = tableView.dequeue(forIndexPath: indexPath) as SettingsViewCell;
        cell.lbl.text = items[indexPath.row].name;
        cell.iv.image = UIImage(named: items[indexPath.row].image);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let msg: String = "Automate Proto\nVersion 0.0.1\n(c)2018Automate Inc. All Rights Reserved";
            Director.getInstance().showSimpleSheet(withTitle: "About Application", message: msg, viewController: self);
            break;
        case 1:
            let destination = AccountViewController() as AccountViewController;
            self.navigationController?.pushViewController(destination, animated: true);
            break;
        default:
            break;
        }
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    @objc func onCloseButtonClicked() {
        self.navigationController?.dismiss(animated: true, completion: nil);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}/** end class. */
