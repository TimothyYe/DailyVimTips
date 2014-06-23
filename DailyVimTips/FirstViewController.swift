//
//  FirstViewController.swift
//  DailyVimTips
//
//  Created by Timothy Ye on 6/3/14.
//  Copyright (c) 2014 iTimothy. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
                            
    @IBOutlet var Command : UILabel
    @IBOutlet var Comment : UITextView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var bgColor = UIColor(patternImage: UIImage(named: "5sbackground.jpg"))
        self.view.backgroundColor = bgColor
        
        let singleFingerTap = UITapGestureRecognizer(target: self, action: "handleSingleTap:")
        self.view.addGestureRecognizer(singleFingerTap)
        
        getNextVimTip()
        
         }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        println("Tapped!")
        getNextVimTip()
    }
    
    func getNextVimTip() {
        
        var dict = getVimTip()
        
        Command.text = dict["content"] as String
        Comment.text = dict["comment"] as String
    }
    
    func getVimTip() -> NSDictionary {
        
        var url = NSURL.URLWithString("http://vim-tips.com/random_tips.json")
        var request = NSURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: NSTimeInterval(10))
        var received = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        
        var err: NSErrorPointer = nil
        var dict: NSDictionary = NSJSONSerialization.JSONObjectWithData(received, options: NSJSONReadingOptions.MutableLeaves, error: err) as NSDictionary
        
        println(dict["content"])
        println(dict["comment"])
        
        var arr : Int[]
        
        arr = Int[]()
        
        arr.append(3)
        
        return dict
    }
}

