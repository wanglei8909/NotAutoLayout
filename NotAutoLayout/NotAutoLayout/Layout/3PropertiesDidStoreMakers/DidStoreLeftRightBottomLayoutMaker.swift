//
//  DidStoreLeftRightBottomLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftRightBottomLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let right: LayoutElement.Horizontal
	
	let bottom: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreLeftRightBottomLayoutProperty {
	
	private func makeFrame(left: CGFloat, right: CGFloat, bottom: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = bottom - height
		let width = right - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreLeftRightBottomLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: CalculationParameters) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let width = right - left
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, right: right, bottom: bottom, height: height)
		
	}
	
}
