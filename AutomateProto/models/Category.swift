//
//  Category.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class Category: NSObject, NSCoding {
    
    public static let FILENAME     = "ap_category.bin";
    
    var name: String?;
    var image: Data?;
    var documents: [Document]? = [Document]();
    
    struct CategoryKey {
        static let name = "name";
        static let image = "image";
        static let documents = "documents";
    }
    
    override init() {
        super.init();
    }
    
    init(name: String?, image: Data?, documents: [Document]?) {
        self.name = name;
        self.image = image;
        if documents != nil {
            self.documents = documents;
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: CategoryKey.name);
        aCoder.encode(image, forKey: CategoryKey.image);
        aCoder.encode(documents, forKey: CategoryKey.documents);
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: CategoryKey.name) as? String;
        let i = aDecoder.decodeObject(forKey: CategoryKey.image) as? Data;
        let documents = aDecoder.decodeObject(forKey: CategoryKey.documents) as? [Document];
        self.init(name: name, image: i, documents: documents);
    }

    public func toString() -> String? {
        return "Category: {name=" + self.name! + "}";
    }
    
}/** end class. */
