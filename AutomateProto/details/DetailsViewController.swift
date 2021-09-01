//
//  DetailsViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var document: Document?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true;
        }
        self.initComponents();
    }

    private func initComponents() {
        tableView.dataSource = self;
        tableView.delegate = self;
        if (document != nil) {
            self.title = document?.name;
            let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 400));
            let iv: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: header.frame.width, height: 400));
            iv.isUserInteractionEnabled = true;
            iv.image = UIImage(data: (document?.image)!);
            iv.contentMode = .scaleAspectFit;
            header.addSubview(iv);
            tableView.tableHeaderView = header;
            tableView.tableFooterView = UIView();
            
            let tapHeader = UITapGestureRecognizer(target: self, action: #selector(DetailsViewController.clickedHeader));
            iv.addGestureRecognizer(tapHeader);
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DetailsViewCell = tableView.dequeue(forIndexPath: indexPath) as DetailsViewCell;
        let content: String = (document?.time)! + "\n" + (document?.date)! + "\n" + (document?.content)!;
        cell.tvContent.text = content;
        return cell;
    }
    
    @objc func clickedHeader(sender: UITapGestureRecognizer) {
        let destination: PreviewViewController = PreviewViewController() as PreviewViewController;
        destination.titleStirng = self.title;
        if (document?.image != nil) {
            destination.image = UIImage(data: (document?.image!)!);
        }
        self.navigationController?.pushViewController(destination, animated: true);
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
