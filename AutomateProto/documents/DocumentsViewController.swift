//
//  DocumentsViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GenericEventListener {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttAdd: Button!
    
    var categoryName: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true;
        }
        self.title = categoryName!;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        Director.getInstance().convertButtonToFab(bgColor: Director.BLUE_COLOR, highlightColor: Director.BLUE_HIGHLIGHT, fab: buttAdd);
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (Director.getInstance().getDocumentsList(forCategoryName: categoryName!)?.count)!;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(for: indexPath) as GenericCollectionViewCell;
        cell.ivThumb.image = UIImage(data: Director.getInstance().getDocumentsList(forCategoryName: categoryName!)![indexPath.item].image!);
        cell.lblTitle.text = Director.getInstance().getDocumentsList(forCategoryName: categoryName!)![indexPath.item].name;
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let document: Document = Director.getInstance().findDocument(withIndex: indexPath.item, inCategoryName: categoryName!)!;
        let destination: DetailsViewController = DetailsViewController() as DetailsViewController;
        destination.document = document;
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

    @IBAction func onButtAdd(_ sender: Any) {
        let destination = AddDocumentViewController() as AddDocumentViewController;
        destination.eventListener = self;
        destination.categoryName = categoryName;
        self.navigationController?.pushViewController(destination, animated: true);
    }
    
    func onEvent() {
        self.collectionView.reloadData();
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
