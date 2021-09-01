//
//  Document.swift
//  AutomateProto
//
//  Created by Talha Ghous on 22/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit

class Document: NSObject, NSCoding {
    
    var name: String?;
    var image: Data?;
    var time: String?;
    var date: String?;
    var content: String?;
    
    struct DocumentKey {
        static let name = "name";
        static let image = "image";
        static let time = "time";
        static let date = "date";
        static let content = "content";
    }
    
    override init() {
        super.init();
    }
    
    init(name: String?, image: Data?, time: String?, date: String?, content: String?) {
        self.name = name;
        self.image = image;
        self.time = time;
        self.date = date;
        self.content = content;
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: DocumentKey.name);
        aCoder.encode(image, forKey: DocumentKey.image);
        aCoder.encode(time, forKey: DocumentKey.time);
        aCoder.encode(date, forKey: DocumentKey.date);
        aCoder.encode(content, forKey: DocumentKey.content);
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: DocumentKey.name) as? String;
        let image = aDecoder.decodeObject(forKey: DocumentKey.image) as? Data;
        let time = aDecoder.decodeObject(forKey: DocumentKey.time) as? String;
        let date = aDecoder.decodeObject(forKey: DocumentKey.date) as? String;
        let content = aDecoder.decodeObject(forKey: DocumentKey.content) as? String;
        self.init(name: name, image: image, time: time, date: date, content: content);
    }
    
}/** end class. */
