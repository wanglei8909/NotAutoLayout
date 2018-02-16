//
//  DidStoreTopRightHeightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopRightHeightLayoutProperty {
	
	let topRight: LayoutElement.Point
	
	let height: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreTopRightHeightLayoutProperty {
	
	private func makeFrame(topRight: CGPoint, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = topRight.x - width
		let y = topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopRightHeightLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topRight: topRight, height: height, width: width)
		
	}
	
}