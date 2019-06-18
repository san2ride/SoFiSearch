//
//  ImgurViewCell.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/18/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import UIKit

class ImgurViewCell: UITableViewCell {
    public static let reuseIdentifier = "SearchCell"
    
    
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchTitleLabel: UILabel!
    
    public func configureCell(_ search: Search) {
        
    }
}
