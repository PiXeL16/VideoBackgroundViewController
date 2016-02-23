//
//  VideoBackgroundControllerSpec.swift
//  VideoBackgroundViewController
//
//  Created by Chris Jimenez on 2/22/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import Nimble
import Quick
import VideoBackgroundViewController


//Specs for the delayer class
class VideoBackgroundControllerSpec: QuickSpec {
    
    override func spec() {
        
        let videoBackgroundViewController = VideoBackgroundViewController()
        
        it("is correct with initial values"){
            
            expect(videoBackgroundViewController.videoPlayer).notTo(beNil())
            expect(videoBackgroundViewController.soundLevel).to(equal(1.0))
            expect(videoBackgroundViewController.playSound).to(beTrue())
            expect(videoBackgroundViewController.videoURL).to(beNil())
            expect(videoBackgroundViewController.videoShouldLoop).to(beTrue())
            expect(videoBackgroundViewController.videoScalingMode).to(equal(VideoScalingMode.ResizeAspectFill))
            expect(videoBackgroundViewController.backgroundColor).to(equal(UIColor.blackColor()))
        }
        
    }
    
}
