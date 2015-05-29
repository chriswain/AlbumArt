//
//  ViewController.swift
//  AlbumArt
//
//  Created by Christopher Wainwright Aaron on 5/29/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit
import AFNetworking



class AlbumDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var albumInfo: [String:AnyObject]!
    
    @IBOutlet weak var albumNameLabel: UILabel!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var tracksTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(albumInfo)
        
        albumNameLabel.text = albumInfo["collectionName"] as? String
        artistNameLabel.text = albumInfo["artistName"] as? String
        
        if let albumID = albumInfo["collectionId"] as? Int {
            
            var requestManager = AFHTTPRequestOperationManager()
            
            requestManager.GET(itunesLookupAPI + "?entity=song&id=\(albumID)", parameters: nil, success: { (request, data) -> Void in
                
                let info = data as! [String:AnyObject]
                
                self.tracks = info["results"] as! [[String:AnyObject]]
                self.tracks.removeAtIndex(0)
                self.tracksTableView.reloadData()
                
                }) { (request, error) -> Void in
                    
                    println(error)
            }
        }
        
    }
    
    var tracks: [[String:AnyObject]] = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tracks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("trackCell",
            forIndexPath: indexPath) as! TrackTableViewCell
        
        cell.trackInfo = tracks[indexPath.row]
        
        return cell
        
    }
    
    
}

