//
//  PreviewViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var iv: UIImageView!
    
    var titleStirng: String? = "Preview";
    var image: UIImage?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = titleStirng;
        scrollView.delegate = self;
        scrollView.minimumZoomScale = 1.0;
        scrollView.maximumZoomScale = 10.0;
        
        if (image != nil) {
            iv.image = image!;
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return iv;
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
