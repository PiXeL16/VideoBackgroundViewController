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
open class VideoBackgroundViewController: UIViewController {
    
    /// The video player to use for the video in the background
    open let videoPlayer: AVPlayerViewController = AVPlayerViewController()
    // The sound level of hte video
    open var soundLevel: Float = 1.0
    // If the video should have sound or not
    open var playSound: Bool = true {
        
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
    open var videoURL: URL! {
        
        didSet{
            
            videoPlayer.player = AVPlayer(url: videoURL)
            videoPlayer.player?.volume = self.soundLevel
            videoPlayer.player?.play()
            
        }
    }
    
    /// Alpha to apply to the video
    open var alpha: CGFloat = CGFloat(1.0) {
        didSet {
            videoPlayer.view.alpha = alpha
        }
    }
    
    
    /// If the video will loop or not
    open var videoShouldLoop: Bool = true {
        
        didSet {
            if videoShouldLoop {
                NotificationCenter.default.addObserver(self,
                    selector: #selector(VideoBackgroundViewController.videoPlayerItemDidReachEnd),
                    name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                    object: videoPlayer.player?.currentItem)
            }
        }
    }
    
    /**
     Gets trigger when the video goes to the end, 
     */
    @objc func videoPlayerItemDidReachEnd() {
        videoPlayer.player?.seek(to: kCMTimeZero)
        videoPlayer.player?.play()
    }
    
    /// The aspect scaling mode of the video, defaults to ResizeAspectFill
    open var videoScalingMode: VideoScalingMode = .resizeAspectFill {
        didSet {
            switch videoScalingMode {
            case .resize:
                videoPlayer.videoGravity = AVLayerVideoGravity.resize.rawValue
            case .resizeAspect:
                videoPlayer.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue
            case .resizeAspectFill:
                videoPlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            }
        }
    }
    
    
    /// The frame size of the video
    open var videoFrame: CGRect = CGRect()
    
    //The background color of the video
    open var backgroundColor: UIColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        videoFrame = view.frame
        self.videoShouldLoop = true
        self.alpha = 0.8
        self.playSound = false
        self.videoScalingMode = .resizeAspectFill
        
        
    }
    
    
    /**
     Delegate when the view will appear
     
     - parameter animated: It it appears animated or not
     */
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Sets the frame
        videoPlayer.view.frame = videoFrame
        //Hides the playback controls
        videoPlayer.showsPlaybackControls = false
        //Adds the video as a subview
        view.addSubview(videoPlayer.view)
        //Sends it to the back
        view.sendSubview(toBack: videoPlayer.view)
    }
    

    //Removes the observer
    deinit{
         NotificationCenter.default.removeObserver(self)
    }
    
    

}
