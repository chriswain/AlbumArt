//
//  TrackTableViewCell.swift
//  AlbumArt
//
//  Created by Christopher Wainwright Aaron on 5/29/15.
//  Copyright (c) 2015 Christopher Wainwright Aaron. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    var trackInfo: [String:AnyObject]! {
        
        didSet {
        
            trackNameLabel.text = trackInfo["trackName"] as? String 
        }
    }
    
    @IBOutlet weak var toggleSong: UIButton!
    
    @IBOutlet weak var trackNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
