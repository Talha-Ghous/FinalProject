//
//  LoadingDialog.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class LoadingDialog: NSObject {

    let alert: UIAlertController;
    
    init(message: String) {
        alert = UIAlertController(title: nil, message: message, preferredStyle: .alert);
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50));
        loadingIndicator.hidesWhenStopped = true;
        loadingIndicator.style = UIActivityIndicatorView.Style.gray;
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator);
    }
    
    public func show(viewController: UIViewController) {
        viewController.present(alert, animated: true, completion: nil);
    }
    
    public func dismiss() {
        alert.dismiss(animated: true, completion: nil);
    }
    
}/** end class. */
