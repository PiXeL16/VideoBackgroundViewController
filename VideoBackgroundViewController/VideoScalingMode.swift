//
//  VideoFillMode.swift
//  VideoBackgroundViewController
//
//  Created by Chris Jimenez on 2/22/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation


/**
 Enum for the scaling mode of the video view controller
 
 - Resize:           Resize to fit
 - ResizeAspect:     Resize an mantain aspect
 - ResizeAspectFill: Resize and fill
 */
public enum VideoScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}
