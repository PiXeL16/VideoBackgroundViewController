//
//  VideoBackgroundViewController.swift
//  VideoBackgroundViewController
//
//  Created by Chris Jimenez on 2/22/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer
import AVKit

/// Class that shows a video in the backgroun of the view controller
public class VideoBackgroundViewController: UIViewController {
    
    /// The video player to use for the video in the background
    public let videoPlayer: AVPlayerViewController = AVPlayerViewController()
    // The sound level of hte video
    public var soundLevel: Float = 1.0
    // If the video should have sound or not
    public var playSound: Bool = true {
        
        didSet{
            if playSound {
                soundLevel = 1.0
            }
            else {
                soundLevel = 0.0
            }
        }
    }
    
    //The URL of the video to play
    public var videoURL: NSURL = NSURL(){
        
        didSet{
            
            videoPlayer.player = AVPlayer(URL: videoURL)
            videoPlayer.player?.volume = self.soundLevel
            videoPlayer.player?.play()
            
        }
    }
    
    /// Alpha to apply to the video
    public var alpha: CGFloat = CGFloat(0.0) {
        didSet {
            videoPlayer.view.alpha = alpha
        }
    }
    
    
    /// If the video will loop or not
    public var videoShouldLoop: Bool = true {
        
        didSet {
            if videoShouldLoop {
                NSNotificationCenter.defaultCenter().addObserver(self,
                    selector: "videoPlayerItemDidReachEnd",
                    name: AVPlayerItemDidPlayToEndTimeNotification,
                    object: videoPlayer.player?.currentItem)
            }
        }
    }
    
    /**
     Gets trigger when the video goes to the end, 
     */
    func videoPlayerItemDidReachEnd() {
        videoPlayer.player?.seekToTime(kCMTimeZero)
        videoPlayer.player?.play()
    }
    
    /// The aspect scaling mode of the video, defaults to ResizeAspectFill
    public var videoScalingMode: VideoScalingMode = .ResizeAspectFill {
        didSet {
            switch videoScalingMode {
            case .Resize:
                videoPlayer.videoGravity = AVLayerVideoGravityResize
            case .ResizeAspect:
                videoPlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .ResizeAspectFill:
                videoPlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    
    /// The frame size of the video
    public var videoFrame: CGRect = CGRect()
    
    //The background color of the video
    public var backgroundColor: UIColor = UIColor.blackColor() {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Sets the frame
        videoPlayer.view.frame = videoFrame
        //Hides the playback controls
        videoPlayer.showsPlaybackControls = false
        //Adds the video as a subview
        view.addSubview(videoPlayer.view)
        //Sends it to the back
        view.sendSubviewToBack(videoPlayer.view)
    }
    

    //Remove the observer
    deinit{
        
         NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    

}
