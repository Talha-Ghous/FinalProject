//
//  AccountViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 23/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var ch: UISwitch!
    @IBOutlet weak var lablCh: UILabel!
    @IBOutlet weak var buttUpdate: Button!
    @IBOutlet weak var buttCancel: Button!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tfPassword.isSecureTextEntry = true;
        self.ch.setOn(false, animated: true);
        
        self.buttUpdate.backgroundColor = Director.BLUE_COLOR;
        self.buttUpdate.customBgColor = Director.BLUE_COLOR;
        self.buttUpdate.highlightColor = Director.BLUE_HIGHLIGHT;
        self.buttUpdate.layer.cornerRadius = 8;
        
        self.buttCancel.backgroundColor = Director.RED_COLOR;
        self.buttCancel.customBgColor = Director.RED_COLOR;
        self.buttCancel.highlightColor = Director.RED_HIGHLIGHT;
        self.buttCancel.layer.cornerRadius = 8;
        
        if (Director.getInstance().getUser() != nil) {
            self.tfEmail.text = Director.getInstance().getUser()?.email;
            self.tfPassword.text = Director.getInstance().getUser()?.password;
        }
    }

    @IBAction func onUpdateClicked(_ sender: Any) {
        if (tfEmail.text != nil) {
            if (!(tfEmail.text?.isEmpty)!) {
                if (Director.getInstance().isValidEmail(email: tfEmail.text!)) {
                    if (!(tfPassword.text?.isEmpty)!) {
                        if (Director.getInstance().updateUser(email: tfEmail.text!, password: tfPassword.text!)) {
                            print("User updated successfully");
                            self.dismiss(animated: true, completion: nil);
                        }
                    }
                } else {
                    Director.getInstance().showSimpleSheet(withTitle: "Error", message: "Provided email is invalid. Please provide a valid email address", viewController: self);
                }
            } else {
                Director.getInstance().showSimpleSheet(withTitle: "Error", message: "Email can't be empty, its required.", viewController: self);
            }
        }
    }
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func onCh(_ sender: Any) {
        if (ch.isOn) {
            lablCh.text = "Hide Password";
            self.tfPassword.isSecureTextEntry = false;
            self.tfPassword.becomeFirstResponder();
        } else {
            lablCh.text = "Show Password";
            self.tfPassword.isSecureTextEntry = true;
            self.tfPassword.becomeFirstResponder();
        }
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
