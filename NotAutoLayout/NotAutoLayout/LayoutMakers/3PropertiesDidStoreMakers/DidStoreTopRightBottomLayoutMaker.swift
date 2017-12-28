//
//  DidStoreTopRightBottomLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopRightBottomLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topRight: LayoutElement.Point
	
	let bottom: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreTopRightBottomLayoutMaker {
	
	private func makeFrame(topRight: CGPoint, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = topRight.x - width
		let y = topRight.y
		let height = bottom - y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopRightBottomLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let height = bottom - topRight.y
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topRight: topRight, bottom: bottom, width: width)
		
	}
	
}
