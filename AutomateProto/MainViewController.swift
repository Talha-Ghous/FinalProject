//
//  MainViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GenericEventListener, DrawerActionListener {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fab: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true;
        }
        self.navigationController?.navigationItem.searchController = UISearchController(searchResultsController: nil);
        self.navigationController?.navigationItem.hidesSearchBarWhenScrolling = true;
        initComponents();
        
        checkUser();
    }
    
    /**
     *
     * Initializes components
     * */
    private func initComponents() {
        Director.getInstance().drawerAdatper = self;
        self.title = "Automate Proto";
        collectionView.delegate = self;
        collectionView.dataSource = self;
        self.createFAB();
    }
    
    @IBAction func onMenuButtonClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.drawerContainer?.toggle(MMDrawerSide.left, animated: true, completion: nil);
    }
    
    // OVERRIDDEN
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Director.getInstance().getCategoriesList().count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(for: indexPath) as GenericCollectionViewCell;
        cell.ivThumb.image = UIImage(data: Director.getInstance().getCategoriesList()[indexPath.item].image!);
        cell.lblTitle.text = Director.getInstance().getCategoriesList()[indexPath.item].name;
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination: DocumentsViewController = DocumentsViewController() as DocumentsViewController;
        destination.categoryName = Director.getInstance().getCategoriesList()[indexPath.row].name;
        self.navigationController?.pushViewController(destination, animated: true);
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath);
        cell?.layer.cornerRadius = 8;
        cell?.contentView.layer.borderWidth = 1.0;
        cell?.contentView.layer.borderColor = UIColor.clear.cgColor;
        cell?.contentView.layer.masksToBounds = true;
        cell?.contentView.backgroundColor = UIColor.lightGray;
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath);
        cell?.layer.cornerRadius = 8;
        cell?.contentView.layer.borderWidth = 1.0;
        cell?.contentView.layer.borderColor = UIColor.clear.cgColor;
        cell?.contentView.layer.masksToBounds = true;
        cell?.contentView.backgroundColor = UIColor.white;
    }
    
    private func checkUser() {
        if ((Director.getInstance().getDataFromSharedPrefs(key: "user") as? String) == nil) {
            let destination: StartupNavigationViewController = StartupNavigationViewController() as StartupNavigationViewController;
            self.present(destination, animated: true, completion: nil);
        }
    }
    
    private func createFAB() {
        let blueColor = UIColor(red: 0.1, green: 0.56, blue: 1, alpha: 1);
        let blueHighlight = UIColor(red: 0.24, green: 0.31, blue: 0.70, alpha: 1);
        
        fab.clipsToBounds = true;
        fab.layer.cornerRadius = 30;
        fab.backgroundColor = blueColor;
        fab.layer.masksToBounds = false;
        fab.layer.borderWidth = 3.0;
        fab.layer.borderColor = UIColor.white.cgColor;
        fab.layer.shadowColor = UIColor.lightGray.cgColor;
        fab.layer.shadowOffset = CGSize(width:0, height: 2.0);
        fab.layer.shadowRadius = 8.0;
        fab.layer.shadowOpacity = 1.0;
        fab.layer.shadowPath = UIBezierPath(roundedRect: fab.bounds, cornerRadius: fab.layer.cornerRadius).cgPath;
        fab.customBgColor = blueColor;
        fab.highlightColor = blueHighlight;
    }
    
    @IBAction func onFabClicked(_ sender: Any) {
        let destination: AddCategoryViewController = AddCategoryViewController() as AddCategoryViewController;
        destination.eventListener = self;
        self.navigationController?.pushViewController(destination, animated: true);
    }
    
    func onEvent() {
        self.collectionView.reloadData();
    }
    
    func onAbout() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.drawerContainer?.toggle(MMDrawerSide.left, animated: true, completion: nil);
        
        let msg: String = "Automate Proto\nVersion 0.0.1\n(c)2018Automate Inc. All Rights Reserved";
        Director.getInstance().showSimpleSheet(withTitle: "About Application", message: msg, viewController: self);
    }
    
    func onAccount() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.drawerContainer?.toggle(MMDrawerSide.left, animated: true, completion: nil);
        
        let destination = AccountViewController() as AccountViewController;
        self.present(destination, animated: true, completion: nil);
    }
    
    func onSettings() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.drawerContainer?.toggle(MMDrawerSide.left, animated: true, completion: nil);
        
        let destination = SettingsNavigationViewController() as SettingsNavigationViewController;
        self.present(destination, animated: true, completion: nil);
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
