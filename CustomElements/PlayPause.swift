//
//  PlayPause.swift
//  AudioTest
//
//  Created by Scott Krulcik on 2/27/15.
//  Copyright (c) 2015 Scott Krulcik. All rights reserved.
//

import UIKit

public enum MediaState {
    case Play, Pause
}

@IBDesignable public class PlayPause: UIView {

    @IBInspectable var triSize: CGFloat = 0.55
    @IBInspectable var lineWidth: CGFloat = 3.0
    @IBInspectable var fillsTri: Bool = false
    @IBInspectable var closesPath: Bool = true
    @IBInspectable var paused: Bool = false {
        didSet {
            if paused {
                mode = .Pause
            } else {
                mode = .Play
            }
        }
    }
    
    public var mode:MediaState = .Play {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    public func toggleState() {
        if mode == .Play {
            mode = .Pause
        } else {
            mode = .Play
        }
    }

    override public func drawRect(rect: CGRect) {
        // Draw Play pause button
        if mode == .Pause {
            var darkShadow = UIColor.blackColor()
            // Put dark shade over album color
            alpha = 0.75
            darkShadow.setFill()
            let coverRect = UIBezierPath(rect: rect)
            coverRect.fill()
            
            // Fill outer circle
            let r:CGFloat = rect.width/6
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let outerCircle = UIBezierPath(arcCenter: center, radius: r,
                startAngle: 0.0, endAngle: CGFloat(2*M_PI),
                clockwise: false)
            UIColor.whiteColor().setFill()
            outerCircle.fill()
            
            // Subtract play symbol
            darkShadow.setFill() // Reset to drawing with blackish color
            darkShadow.setStroke()
            // Evenly distribute points to make triangle
            let angleList = anglesForPoints(3) // Three points of triangle
            let small_r = r * triSize // Radius of circle triangle gets inscribed in
            let pointList = angleList.map({angle in pointOnCircle(center.x, y: center.y,
                                                                    r: small_r, theta: angle)})
            assert(pointList.count > 0)
            var triPath = UIBezierPath()
            triPath.lineJoinStyle = CGLineJoin.Round// kCGLineJoinMiter
            triPath.lineWidth = lineWidth
            triPath.moveToPoint(pointList.first!)
            for(var i = 1; i < pointList.count; i++) {
                triPath.addLineToPoint(pointList[i])
            }
            if closesPath {
                triPath.closePath()
            }
            triPath.stroke()
            if fillsTri {
                triPath.fill()
            }
        } else {
            self.backgroundColor = UIColor.clearColor()
        }
    }

}
