//
//  SearchController.swift
//  SoFiSearch
//
//  Created by Jason Sanchez on 6/14/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import UIKit
import RevealingSplashView


class SearchController: UIViewController {
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "sofi")!,
                                                  iconInitialSize: CGSize(width: 280, height: 112),
                                                  backgroundColor: UIColor.white)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        
        revealingSplashView.heartAttack = true

    }
    

    
}
