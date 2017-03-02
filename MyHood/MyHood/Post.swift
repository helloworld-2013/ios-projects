//
//  Post.swift
//  MyHood
//
//  Created by Indra Gunawan on 1/3/17.
//  Copyright © 2017 MyLab Inc. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imagePath: String
    private var _title: String
    private var _desc: String
    
    var imagePath: String {
        return _imagePath
    }

    var title: String {
        return _title
    }
    
    var desc: String {
        return _desc
    }
    
    init(imagePath: String, title: String, desc: String) {
        self._imagePath = imagePath
        self._title = title
        self._desc = desc
    }
    
    override init() {
        self._imagePath = ""
        self._title = ""
        self._desc = ""
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = (aDecoder.decodeObject(forKey: "imagePath") as? String)!
        self._title = (aDecoder.decodeObject(forKey: "title") as? String)!
        self._desc = (aDecoder.decodeObject(forKey: "desc") as? String)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._title, forKey: "title")
        aCoder.encode(self._desc, forKey: "desc")
    }

}
