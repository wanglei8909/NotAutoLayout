//
//  DidStoreCenterRightMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterRightMiddleLayoutProperty {
	
	let center: LayoutElement.Horizontal
	
	let right: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreCenterRightMiddleLayoutProperty {
	
	private func makeFrame(center: CGFloat, right: CGFloat, middle: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middle).doubled
		
		return self.makeFrame(center: center, right: right, middle: middle, height: height)
		
	}
	
	private func makeFrame(center: CGFloat, right: CGFloat, middle: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (right - center).doubled
		let x = right - width
		let y = middle - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreCenterRightMiddleLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: CalculationParameters) -> CGRect {
		
		let center = self.center.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(center: center, right: right, middle: middle, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreCenterRightMiddleLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: CalculationParameters) -> CGRect {
		
		let center = self.center.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let width = (right - center).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, right: right, middle: middle, height: height)
		
	}
	
}
