//
//  ViewController.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 31/05/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos() 
    }


}

