//
//  User.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    
    public static let FILENAME: String  = "ap_user.bin";
    
    var email: String?;
    var password: String?;
    
    struct UserKey {
        static let email = "email";
        static let password = "password";
    }
    
    override init() {
        super.init();
    }
    
    init(email: String?, password: String?) {
        self.email = email;
        self.password = password;
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(email, forKey: UserKey.email);
        aCoder.encode(password, forKey: UserKey.password);
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let email = aDecoder.decodeObject(forKey: UserKey.email) as? String;
        let password = aDecoder.decodeObject(forKey: UserKey.password) as? String;
        self.init(email: email, password: password);
    }
    
    public static func load() -> Bool {
        let user = Director.getInstance().loadFile(filename: User.FILENAME) as User?;
        if user != nil {
            Director.getInstance().user = user;
            return true;
        }
        return false;
    }
    
    public static func save(user: User) -> Bool {
        return Director.getInstance().saveFile(filename: User.FILENAME, k: user);
    }
    
    public func toString() -> String? {
        return "User: {email=" + self.email! + " , password=" + self.password! + "}";
    }
    
}/** end class. */
