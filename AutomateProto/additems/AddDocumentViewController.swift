//
//  AddDocumentViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 23/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class AddDocumentViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var categoryName: String?;
    var eventListener: GenericEventListener?;
    @IBOutlet weak var buttGallery: Button!
    @IBOutlet weak var buttCamera: Button!
    @IBOutlet weak var buttApply: Button!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var taContent: UITextView!
    @IBOutlet weak var iv: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "New Document";
        Director.getInstance().convertButtonToFab(bgColor: Director.RED_COLOR, highlightColor: Director.RED_HIGHLIGHT, fab: buttCamera);
        Director.getInstance().convertButtonToFab(bgColor: Director.BLUE_COLOR, highlightColor: Director.BLUE_HIGHLIGHT, fab: buttApply);
        Director.getInstance().convertButtonToFab(bgColor: Director.RED_COLOR, highlightColor: Director.RED_HIGHLIGHT, fab: buttGallery);
    }
    
    @IBAction func onButtCam(_ sender: Any) {
        let cam = CameraAdapter(delegate_: self);
        cam.getCameraOn(self, canEdit: true);
    }
    
    @IBAction func onButtGallery(_ sender: Any) {
        let cam = CameraAdapter(delegate_: self);
        cam.getPhotoLibrary(self, canEdit: true);
    }
    
    @IBAction func onButtApply(_ sender: Any) {
        if (tfName.text != nil) {
            if (!(tfName.text?.isEmpty)!) {
                let doc: Document = Document(name: tfName.text, image: iv.image?.pngData(), time: Director.getInstance().getTime(), date: Director.getInstance().getDate(), content: taContent.text);
                if (Director.getInstance().addDocument(forCategoryName: categoryName!, document: doc)) {
                    print("Document added successfully!");
                    if (eventListener != nil) {
                        eventListener?.onEvent();
                    }
                    self.navigationController?.popViewController(animated: true);
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage;
        self.iv.image = image;
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
