//
//  DataService.swift
//  MyHood
//
//  Created by Indra Gunawan on 2/3/17.
//  Copyright © 2017 MyLab Inc. All rights reserved.
//

import Foundation
import UIKit

class DataService {

    static let instance = DataService()
    
    private var _loadedPosts = [Post]()
    
    let KEY_POSTS = "posts"
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }

    func savePosts() {
        let postsValue = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.setValue(postsValue, forKey: KEY_POSTS)
        UserDefaults.standard.synchronize()
    }
    
    func loadPosts() {
        if let postsValue = UserDefaults.standard.object(forKey: KEY_POSTS) as? NSData {
            if let postsArr = NSKeyedUnarchiver.unarchiveObject(with: postsValue as Data) as? [Post] {
                _loadedPosts = postsArr
            }
        }
        
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "onPostsLoaded")))
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileName(name: imgPath)
        try? imgData?.write(to: URL(fileURLWithPath: fullPath))
        return imgPath
    }
    
    func imageFromPath(path: String) -> UIImage {
        let fullPath = documentsPathForFileName(name: path)
        let image = UIImage(named: fullPath)
        return image!
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = paths[0] as String
        return path.appending("/" + name)
    }

}
