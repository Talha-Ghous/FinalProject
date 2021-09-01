//
//  StartupNavigationViewController.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class StartupNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let destination: LoginViewController = LoginViewController() as LoginViewController;
        self.pushViewController(destination, animated: true);
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
