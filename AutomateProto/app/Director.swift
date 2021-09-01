//
//  Director.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//
// {@code class} Director is Singleton.

import UIKit

class Director: NSObject {

    private static var sInstance: Director? = nil;
    
    public static let NOT_APPLICABLE: String = "N/A"
    public static let BLUE_COLOR = UIColor(red: 0.1, green: 0.56, blue: 1, alpha: 1);
    public static let BLUE_HIGHLIGHT = UIColor(red: 0.24, green: 0.31, blue: 0.70, alpha: 1);
    public static let RED_COLOR = UIColor(red: 0.9, green: 0.49, blue: 0.13, alpha: 1);
    public static let RED_HIGHLIGHT = UIColor(red: 0.75, green: 0.22, blue: 0.16, alpha: 1);
    
    public var user: User?;
    private var categories: [Category] = [Category]();
    
    var drawerAdatper: DrawerActionListener?;
    
    private override init() {
        
    }
    
    public func injectRawData() {
        let image: UIImage = UIImage(named: "ic_documents.png")!;
        let catImg: UIImage = UIImage(named: "ic_category.png")!;
        if addCategory(category: Category(name: "First Category", image: catImg.pngData(), documents: nil)) {
            print("Category added ...");
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content, this is a simple content, a very simple content, again a very simple content, infact this is a long content, infact this is a very long content,THIS IS THE END LINE"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc2", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc3", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc4", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc5", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc6", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc7", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc8", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc9", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc10", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc11", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
            addDocument(forCategoryName: "First Category", document: Document(name: "Simple Doc12", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
        }
        if addCategory(category: Category(name: "Second Category", image: catImg.pngData(), documents: nil)) {
            print("Category added ...");
            addDocument(forCategoryName: "Second Category", document: Document(name: "Simple Doc", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
        }
        if addCategory(category: Category(name: "Third Category", image: catImg.pngData(), documents: nil)) {
            print("Category added ...");
            addDocument(forCategoryName: "Third Category", document: Document(name: "Simple Doc", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
        }
        if addCategory(category: Category(name: "Fourth Category", image: catImg.pngData(), documents: nil)) {
            print("Category added ...");
            addDocument(forCategoryName: "Fourth Category", document: Document(name: "Simple Doc", image: image.pngData(), time: "00:10:23", date: "12/12/2020", content: "this is a simple content"));
        }
    }
    
    /**
     *
     * @return the path as URL
     * */
    public func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first;
        return path!;
    }
    
    /**
     * Saves file in binary format.
     *
     * @param filename as String
     * @param <K> Generic type.
     * @return true if file is saved successfully, false otherwise.
     * */
    public func saveFile<K>(filename: String, k: K) -> Bool {
        let data = NSKeyedArchiver.archivedData(withRootObject: k);
        let fullPath = getDocumentsDirectory().appendingPathComponent(filename);
        do {
            try data.write(to: fullPath);
            print("File: [" + filename + "] saved successfully!");
            return true;
        } catch {
            print("Error while saving file: [" + filename + "]");
        }
        return false;
    }
    
    /**
     * Loades the saved binary object file.
     *
     * @param the filename as String
     * @return loaded object <T>
     * */
    public func loadFile<T>(filename: String) -> T? {
        let fullPath = getDocumentsDirectory().appendingPathComponent(filename);
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: fullPath.path) as? T {
            return loaded;
        }
        return nil;
    }
    
    public func putDataInSharedPrefs(key: String, value: AnyObject) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    public func getDataFromSharedPrefs(key: String) -> AnyObject {
        return UserDefaults.standard.object(forKey: key) as AnyObject
    }
    
    public func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    public func getNonNullAndNonEmptyText(text: String?) -> String {
        if text != nil {
            if !((text?.isEmpty)!) {
                return text!
            }
        }
        return Director.NOT_APPLICABLE
    }
    
    public func getUser() -> User? {
        return self.user;
    }
    
    public func setUser(user: User) -> Bool {
        self.user = user;
        return saveUser();
    }
    
    public func updateUser(email: String, password: String) -> Bool {
        if (self.user != nil) {
            self.user?.email = email;
            self.user?.password = password;
            return saveUser();
        }
        return false;
    }
    
    public func saveUser() -> Bool {
        return saveFile(filename: User.FILENAME, k: user);
    }
    
    public func loadUser() -> User? {
        let u: User? = loadFile(filename: User.FILENAME) as User?;
        if (u != nil) {
            self.user = u;
            return u;
        }
        return nil;
    }
    
    public func getCategoriesList() -> [Category] {
        return self.categories;
    }
    
    public func addCategory(category: Category) -> Bool {
        for (index, element) in categories.enumerated() {
            if element.name == category.name {
                categories[index] = category;
                return saveCategory();
            }
        }
        categories.append(category);
        return saveCategory();
    }
    
    public func addDocument(forCategory: Category, document: Document) -> Bool {
        for (index, element) in categories.enumerated() {
            if (element.name == forCategory.name) {
                for (i, e) in (element.documents?.enumerated())! {
                    if e.name == document.name {
                        categories[index].documents![i] = document;
                        return saveCategory();
                    }
                }
            }
        }
        for (index, element) in categories.enumerated() {
            if (element.name == forCategory.name) {
                categories[index].documents?.append(document);
                return saveCategory();
            }
        }
        return false;
    }
    
    public func addDocument(forCategoryName: String, document: Document) -> Bool {
        for (index, element) in categories.enumerated() {
            if (element.name == forCategoryName) {
                for (i, e) in (element.documents?.enumerated())! {
                    if e.name == document.name {
                        categories[index].documents![i] = document;
                        return saveCategory();
                    }
                }
            }
        }
        for (index, element) in categories.enumerated() {
            if (element.name == forCategoryName) {
                categories[index].documents?.append(document);
                return saveCategory();
            }
        }
        return false;
    }
    
    public func findCategory(byName: String) -> Category? {
        for (index, element) in categories.enumerated() {
            if (element.name == byName) {
                return categories[index];
            }
        }
        return nil;
    }
    
    public func findDocument(byName: String, categoryName: String) -> Document? {
        for (index, element) in categories.enumerated() {
            if (element.name == categoryName) {
                for (i, e) in (element.documents?.enumerated())! {
                    if (e.name == byName) {
                        return categories[index].documents![i];
                    }
                }
            }
        }
        return nil;
    }
    
    public func findDocument(withIndex: Int, inCategoryName: String) -> Document? {
        for (index, element) in categories.enumerated() {
            if (element.name == inCategoryName) {
                return categories[index].documents![withIndex];
            }
        }
        return nil;
    }
    
    public func getDocumentsList(forCategoryName: String) -> [Document]? {
        for (index, element) in categories.enumerated() {
            if (element.name == forCategoryName) {
                return categories[index].documents!;
            }
        }
        return nil;
    }
    
    public func saveCategory() -> Bool {
        if saveFile(filename: Category.FILENAME, k: categories) {
            print("Categories updated successfully!");
            return true;
        }
        return false;
    }
    
    public func loadCategory() -> Bool {
        let c = loadFile(filename: Category.FILENAME) as [Category]?;
        if (c != nil) {
            self.categories = c!;
            return true;
        }
        return false;
    }
    
    public func showSimpleDialog(withTitle: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        viewController.present(alert, animated: true, completion: nil);
    }
    
    public func showSimpleSheet(withTitle: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .actionSheet);
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        viewController.present(alert, animated: true, completion: nil);
    }
    
    public func convertButtonToFab(bgColor: UIColor, highlightColor: UIColor, fab: Button) {
        fab.clipsToBounds = true;
        fab.layer.cornerRadius = 30;
        fab.backgroundColor = bgColor;
        fab.layer.masksToBounds = false;
        fab.layer.borderWidth = 3.0;
        fab.layer.borderColor = UIColor.white.cgColor;
        fab.layer.shadowColor = UIColor.lightGray.cgColor;
        fab.layer.shadowOffset = CGSize(width:0, height: 2.0);
        fab.layer.shadowRadius = 8.0;
        fab.layer.shadowOpacity = 1.0;
        fab.layer.shadowPath = UIBezierPath(roundedRect: fab.bounds, cornerRadius: fab.layer.cornerRadius).cgPath;
        fab.customBgColor = bgColor;
        fab.highlightColor = highlightColor;
    }
    
    public func getDate() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!);
        return today_string
    }
    
    public func getTime() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.hour,.minute,.second], from: date)
        
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }
    
    /**
     *
     * Get Dirctor as Singleton.
     * */
    public static func getInstance() -> Director {
        if sInstance == nil {
            sInstance = Director();
        }
        return sInstance!;
    }
    
}/** end class. */
