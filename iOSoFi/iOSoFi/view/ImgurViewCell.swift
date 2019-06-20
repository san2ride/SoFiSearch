//
//  ImgurViewCell.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/18/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import UIKit

class ImgurViewCell: UITableViewCell {
    public static let cellReuseId = "SearchCell"
    
    
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchTitleLabel: UILabel!
}

func imgurCellFactory(_ tableView: UITableView,
                      _ imgurRequest: Search) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ImgurViewCell.cellReuseId) as! ImgurViewCell
    
    return cell
}
