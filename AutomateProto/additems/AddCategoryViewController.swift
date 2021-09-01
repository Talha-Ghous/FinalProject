//
//  AddCategoryViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 23/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var tfCatName: UITextField!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var buttBrowse: Button!
    @IBOutlet weak var buttApply: Button!
    
    var eventListener: GenericEventListener?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Add Category";
        self.setupButtons();
    }
    
    private func setupButtons() {
        self.buttBrowse.backgroundColor = Director.RED_COLOR;
        self.buttBrowse.customBgColor = Director.RED_COLOR;
        self.buttBrowse.highlightColor = Director.RED_HIGHLIGHT;
        self.buttBrowse.layer.cornerRadius = 8;
        self.buttApply.backgroundColor = Director.BLUE_COLOR;
        self.buttApply.customBgColor = Director.BLUE_COLOR;
        self.buttApply.highlightColor = Director.BLUE_HIGHLIGHT;
        self.buttApply.layer.cornerRadius = 8;
    }

    @IBAction func onButtBrowseClicked(_ sender: Any) {
        let cam = CameraAdapter(delegate_: self);
        cam.getPhotoLibrary(self, canEdit: true);
    }
    
    @IBAction func onButtApplyClicked(_ sender: Any) {
        let category: Category = Category();
        if (tfCatName.text != nil) {
            if (!((tfCatName.text?.isEmpty)!)) {
                category.name = tfCatName.text;
                category.image = ivIcon.image?.pngData();
                if (Director.getInstance().addCategory(category: category)) {
                    self.navigationController?.popViewController(animated: true);
                }
            } else {
                Director.getInstance().showSimpleDialog(withTitle: "Error", message: "Category name can't be empty. It's required.", viewController: self);
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage;
        self.ivIcon.image = image;
        if (eventListener != nil) {
            eventListener?.onEvent();
        }
        picker.dismiss(animated: true, completion: nil);
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
