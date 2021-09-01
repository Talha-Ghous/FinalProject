//
//  LoginViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var ch: UISwitch!
    @IBOutlet weak var lablCh: UILabel!
    @IBOutlet weak var buttonLogin: Button!
    @IBOutlet weak var buttonSignup: Button!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true;
            let attributes = [NSAttributedString.Key.foregroundColor : UIColor.blue];
            self.navigationController?.navigationBar.largeTitleTextAttributes = attributes;
        }
        self.title = "Login";
        self.ch.setOn(false, animated: true);
        self.tfPassword.isSecureTextEntry = true;
        setupButtons();
    }
    
    private func setupButtons() {
        let blueColor = UIColor(red: 0.1, green: 0.56, blue: 1, alpha: 1);
        let blueHighlight = UIColor(red: 0.24, green: 0.31, blue: 0.70, alpha: 1);
        let redColor = UIColor(red: 0.9, green: 0.49, blue: 0.13, alpha: 1);
        let redHighlight = UIColor(red: 0.75, green: 0.22, blue: 0.16, alpha: 1);
    
        self.buttonLogin.customBgColor = blueColor;
        self.buttonLogin.backgroundColor = blueColor;
        self.buttonLogin.highlightColor = blueHighlight;
        self.buttonLogin.layer.cornerRadius = 10;
        self.buttonSignup.customBgColor = redColor;
        self.buttonSignup.backgroundColor = redColor;
        self.buttonSignup.highlightColor = redHighlight;
        self.buttonSignup.layer.cornerRadius = 10;
    }
    
    @IBAction func onShowPasswordClicked(_ sender: Any) {
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
    
    @IBAction func onButtonLogin(_ sender: Any) {
        if (Director.getInstance().getUser() != nil) {
            if (tfEmail.text != nil) {
                if (!(tfEmail.text?.isEmpty)!) {
                    if (Director.getInstance().isValidEmail(email: tfEmail.text!)) {
                        if (!(tfPassword.text?.isEmpty)!) {
                            if (Director.getInstance().getUser()?.email == tfEmail.text &&
                                Director.getInstance().getUser()?.password == tfPassword.text) {
                                Director.getInstance().putDataInSharedPrefs(key: "user", value: "loggedin" as AnyObject);
                                self.navigationController?.dismiss(animated: true, completion: nil);
                            } else {
                                Director.getInstance().showSimpleSheet(withTitle: "Error", message: "Email or password is incorrect, Please try again.", viewController: self);
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
    }
    
    @IBAction func onButtonSignup(_ sender: Any) {
        let destination: SignupViewController = SignupViewController() as SignupViewController;
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
