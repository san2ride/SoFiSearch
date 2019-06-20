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
import RxSwift  
import RxCocoa


class SearchController: UIViewController {
    
    //MARK: - Pivate Properties
    private let provider = MoyaProvider<Imgur>()
    
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
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        state = .loading

        provider.request(.search) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                do {
                    self.state = .ready(try response.map(ImgurResponse<Search>.self).data.results)
                } catch {
                    self.state = .error
                }
            case .failure:
                self.state = .error
            }
        }

        registerView()
        styleView()
    }
}

protocol SearchControllerView {
    
    func bindTo(_ imgurObservable: Observable<[Search]>)
    
    var searchBarTap: ControlEvent<Void> { get }
    
    var searchBarText: ControlProperty<String> { get }

    var searchBarClear: Observable<Void> { get }

}

extension SearchController {
    enum State {
        case loading
        case ready([Search])
        case error
    }
}

extension SearchController: SearchControllerView {
    
    func bindTo(_ imgurObservable: Observable<[Search]>) {
        imgurObservable
            .observeOn(MainScheduler.instance)
            .bind(to: imgurTableView.rx.items) { (tableView: UITableView, index: Int, imgurRequest: Search) in
                let cell = imgurCellFactory(tableView, imgurRequest)
                
                return cell
        }
        .disposed(by: bag)
    }
    
    var searchBarTap: ControlEvent<Void> {
        return imgurSearchBar.rx.searchButtonClicked
    }
    
    var searchBarText: ControlProperty<String> {
        return imgurSearchBar.rx.text.orEmpty
    }
    
    var searchBarClear: Observable<Void> {
        return searchBarText.filter { $0.isEmpty }.map( { _ in () }).skip(1)
    }
}

private extension SearchController {
    
    func registerView() {
        Observable.merge(self.searchBarTap.asObservable(), self.searchBarClear)
            .subscribe(onNext: { (_) in
            })
            .disposed(by: bag)
    }
    
    func styleView() {
        let searchBar = self.imgurSearchBar!
        searchBarTap
            .debug("tap!")
            .subscribe(onNext: { searchBar.resignFirstResponder() })
            .disposed(by: bag)
    }
}
