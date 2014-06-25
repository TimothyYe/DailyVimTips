//
//  SecondViewController.swift
//  DailyVimTips
//
//  Created by Timothy Ye on 6/3/14.
//  Copyright (c) 2014 iTimothy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var bgColor = UIColor(patternImage: UIImage(named: "background.jpg"))
        self.view.backgroundColor = bgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

