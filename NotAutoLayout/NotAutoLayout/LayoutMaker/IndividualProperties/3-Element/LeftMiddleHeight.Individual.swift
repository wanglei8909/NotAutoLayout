//
//  LeftMiddleHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftMiddleHeight {
		
		let left: LayoutElement.Horizontal
		
		let middle: LayoutElement.Vertical
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftMiddleHeight {
	
	private func makeFrame(left: Float, middle: Float, height: Float, width: Float) -> Rect {
		
		let x = left
		let y = middle - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftMiddleHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, middle: middle, height: height, width: width)
		
	}
	
}
