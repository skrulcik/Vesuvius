//
//  ChevronButton.swift
//  AudioTest
//
//  Created by Scott Krulcik on 2/28/15.
//  Copyright (c) 2015 Scott Krulcik. All rights reserved.
//

import UIKit

public enum ChevronButtonDirection {
    case Right, Left
}

@IBDesignable public class ChevronButton: UIButton {

    @IBInspectable public var lineWidth:CGFloat = 4.0
    
    @IBInspectable public var facesRight:Bool = true {
        didSet {
            if facesRight {
                direction = .Right
            } else {
                direction = .Left
            }
        }
    }
    var direction:ChevronButtonDirection = .Right
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func drawRect(rect: CGRect) {
        // Scale down the frame so we don't go outside of rect
        let frm = CGRectInset(rect, rect.width/5, rect.width/4)
        // Establish X parameters to create a chevron in either direction
        var topBotX:CGFloat
        var midX: CGFloat
        if direction == .Right {
            topBotX = frm.minX
            midX = frm.maxX
        } else {
            topBotX = frm.maxX
            midX = frm.minX
        }
        
        // Set drawing color 
        tintColor?.setStroke()
        // Set drawing style
        let chevronPath = UIBezierPath()
        chevronPath.lineJoinStyle = CGLineJoin.Miter
        chevronPath.lineWidth = lineWidth
        // Add points sequentially (do NOT close path)
        chevronPath.moveToPoint(CGPoint(x: topBotX, y: frm.minY))
        chevronPath.addLineToPoint(CGPoint(x: midX, y: frm.midY))
        chevronPath.addLineToPoint(CGPoint(x: topBotX, y: frm.maxY))
        chevronPath.stroke()
    }

}
