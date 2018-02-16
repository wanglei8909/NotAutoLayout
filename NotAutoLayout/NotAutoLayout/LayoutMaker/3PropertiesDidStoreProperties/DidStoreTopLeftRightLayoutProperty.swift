//
//  DidStoreTopLeftRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopLeftRightLayoutProperty {
	
	let topLeft: LayoutElement.Point
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreTopLeftRightLayoutProperty {
	
	private func makeFrame(topLeft: CGPoint, right: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - topLeft.y).doubled
		
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
	private func makeFrame(topLeft: CGPoint, right: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - topLeft.y
		
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
	private func makeFrame(topLeft: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let x = topLeft.x
		let y = topLeft.y
		let width = right - x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreTopLeftRightLayoutProperty: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, right: right, middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopLeftRightLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreTopLeftRightLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = right - topLeft.x
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
}