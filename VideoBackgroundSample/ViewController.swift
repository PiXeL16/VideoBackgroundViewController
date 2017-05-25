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
        
            let url = URL(fileURLWithPath: Bundle.main.path(forResource: "spotifyVideo", ofType: "mp4")!)
            
            self.videoURL = url
//            view.userInteractionEnabled = false
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

