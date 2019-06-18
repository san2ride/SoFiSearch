//
//  SearchController.swift
//  iOSoFi
//
//  Created by Jason Sanchez on 6/17/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation
import UIKit
import Moya

class SearchController: UIViewController {
    
    //MARK: - Pivate Properties
    private let provider = MoyaProvider<Imgur>()
    private var uploadResult: UploadResult?
    
    //MARK: - View State
    private var state: State = .loading {
        didSet {
            switch state {
            case .ready:
                imgurTableView.reloadData()
            case .loading:
                imgurTableView.isHidden = true
            case .error:
                imgurTableView.isHidden = true
            }
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var imgurTableView: UITableView!
    @IBOutlet weak var imgurSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        state = .loading
        
        provider.request
    }
}

extension SearchController {
    enum State {
        case loading
        case ready
        case error
    }
}
