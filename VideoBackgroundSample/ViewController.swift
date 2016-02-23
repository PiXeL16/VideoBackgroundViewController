//
//  ViewController.swift
//  VideoBackgroundSample
//
//  Created by Chris Jimenez on 2/22/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit
import VideoBackgroundViewController

class ViewController: VideoBackgroundViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setVideo()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setVideo()
    {
        
            let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("spotifyVideo", ofType: "mp4")!)
            
            self.videoURL = url
//            view.userInteractionEnabled = false
        
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}

