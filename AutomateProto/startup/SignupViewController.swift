//
//  SignupViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var buttonSignup: Button!
    @IBOutlet weak var ch: UISwitch!
    @IBOutlet weak var lablCh: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Signup";
        setupButton();
        
        tfPassword.isSecureTextEntry = true;
        ch.setOn(false, animated: true);
    }
    
    private func setupButton() {
        let color = UIColor(red: 0.1, green: 0.56, blue: 1, alpha: 1);
        let highlightColor = UIColor(red: 0.24, green: 0.31, blue: 0.70, alpha: 1);
        buttonSignup.customBgColor = color;
        buttonSignup.backgroundColor = color;
        buttonSignup.highlightColor = highlightColor;
        buttonSignup.layer.cornerRadius = 10;
    }

    @IBAction func onButtonSignupClicked(_ sender: Any) {
        if (tfEmail.text != nil) {
            if (!(tfEmail.text?.isEmpty)!) {
                if (Director.getInstance().isValidEmail(email: tfEmail.text!)) {
                    if (!(tfPassword.text?.isEmpty)!) {
                        let user: User = User(email: tfEmail.text, password: tfPassword.text);
                        if (Director.getInstance().setUser(user: user)) {
                            print("User added successfully!");
                            Director.getInstance().putDataInSharedPrefs(key: "user", value: "loggedin" as AnyObject);
                            self.navigationController?.dismiss(animated: true, completion: nil);
                        }
                    }
                } else {
                    Director.getInstance().showSimpleSheet(withTitle: "Error", message: "Provided email is invalid. Please provide a valid email address", viewController: self);
                }
            } else {
                Director.getInstance().showSimpleSheet(withTitle: "Error", message: "Email can't be empty, its required.", viewController: self);
            }
        } else {
            Director.getInstance().showSimpleSheet(withTitle: "Fatal Error", message: "Fatal Error. Email is null", viewController: self);
        }
    }
    
    @IBAction func onShowPasswordClicked(_ sender: Any) {
        if (ch.isOn) {
            lablCh.text = "Hide Password";
            tfPassword.isSecureTextEntry = false;
            tfPassword.becomeFirstResponder();
        } else {
            lablCh.text = "Show Password";
            tfPassword.isSecureTextEntry = true;
            tfPassword.becomeFirstResponder();
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
