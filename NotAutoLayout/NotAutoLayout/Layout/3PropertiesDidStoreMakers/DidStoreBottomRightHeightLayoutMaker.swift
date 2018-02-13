//
//  DidStoreBottomRightHeightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomRightHeightLayoutProperty {
	
	let bottomRight: LayoutElement.Point
	
	let height: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreBottomRightHeightLayoutProperty {
	
	private func makeFrame(bottomRight: CGPoint, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomRight.x - width
		let y = bottomRight.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomRightHeightLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: CalculationParameters) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomRight: bottomRight, height: height, width: width)
		
	}
	
}
