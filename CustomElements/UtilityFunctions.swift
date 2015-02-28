//
//  UtilityFunctions.swift
//  AudioTest
//
//  Created by Scott Krulcik on 2/21/15.
//  Copyright (c) 2015 Scott Krulcik. All rights reserved.
//

import Foundation
import UIKit


func darkenColor(original:UIColor, byFactor coefficient:CGFloat = 0.9) -> UIColor{
    var colorInfo = original.CGColor
    let colorComp = CGColorGetComponents(colorInfo)
    let red = colorComp[0] * coefficient
    let green = colorComp[1] * coefficient
    let blue = colorComp[2] * coefficient
    let alpha = colorComp[3]
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}

func anglesForPoints(numberOfPoints:Int) -> Array<Double>{
    let n = Double(numberOfPoints)
    var angleList = [Double]()
    var i:Double = 0
    while i < n {
        angleList.append((2.0*M_PI) / n * i)
        i++
    }
    return angleList
}

func pointOnCircle(x:CGFloat, y:CGFloat, r:CGFloat, theta:Double) -> CGPoint {
    println("Radius is \(r)")
    let px = x + r * CGFloat(cos(theta))
    let py = y + r * CGFloat(sin(theta))
    return CGPoint(x: px, y: py)
}