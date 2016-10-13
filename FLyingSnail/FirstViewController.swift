//
//  FirstViewController.swift
//  FLyingSnail
//
//  Created by Suric on 16/9/25.
//  Copyright © 2016年 snail. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var modeLabel: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
            modeLabel.text = "This is DEBUG mode"
        #elseif ADHOC
            modeLabel.text = "This is ADHOC mode"
        #else
            modeLabel.text = "This is RELEASE mode"
        #endif
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
