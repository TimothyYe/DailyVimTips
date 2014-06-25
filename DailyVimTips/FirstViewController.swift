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
    
    @IBOutlet var loadingLabel : UILabel
    @IBOutlet var loadingIndicator : UIActivityIndicatorView = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var bgColor = UIColor(patternImage: UIImage(named: "background.jpg"))
        self.view.backgroundColor = bgColor
        
        resetUI()
        
        let singleFingerTap = UITapGestureRecognizer(target: self, action: "handleSingleTap:")
        self.view.addGestureRecognizer(singleFingerTap)
        
        getVimTip()
        
    }
    
    func resetUI() {
        self.loadingIndicator.hidden = false
        self.loadingIndicator.startAnimating()
        self.loadingLabel.hidden = false
        
        self.Command.text = nil
        self.Comment.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        println("Tapped!")
      
        resetUI()
        getVimTip()
    }
    
    func getVimTip() -> NSDictionary {
        let manager = AFHTTPRequestOperationManager()
        let url = "http://vim-tips.com/random_tips.json"
        
        var dict: NSDictionary
        dict = NSDictionary()

        manager.GET(url,
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                println("JSON: " + responseObject.description!)
                
                dict = responseObject as NSDictionary
                
                println(dict["content"])
                println(dict["comment"])
                
                self.loadingIndicator.hidden = true
                self.loadingIndicator.stopAnimating()
                self.loadingLabel.hidden = true
                
                self.Command.text = dict["content"] as String
                self.Comment.text = dict["comment"] as String
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                println("Error: " + error.localizedDescription)

                self.loadingLabel.hidden = true
                self.loadingLabel.text = "Error: " + error.localizedDescription
            })
        
       return dict
    }
}

