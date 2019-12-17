//
//  ViewController.swift
//  Test13ViewWillAppear
//
//  Created by Nick McConnell on 12/16/19.
//  Copyright © 2019 Nick McConnell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewDidLoadCalled = false
    var viewWillAppearCalled = false
    var viewDidAppearCalled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadCalled = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearCalled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearCalled = true
    }

}

