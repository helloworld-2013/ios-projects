//
//  ViewController.swift
//  MyHood
//
//  Created by Indra Gunawan on 1/3/17.
//  Copyright © 2017 MyLab Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.loadPosts()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onPostsLoaded), name: NSNotification.Name(rawValue: "onPostsLoaded"), object: nil)
    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configure(post: post)
            return cell
        } else {
            let cell = PostCell()
            cell.configure(post: post)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }

}

