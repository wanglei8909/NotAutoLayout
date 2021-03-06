//
//  CenterTopMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterTopMiddle {
		
		let center: LayoutElement.Horizontal
		
		let top: LayoutElement.Vertical
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterTopMiddle {
	
	private func makeFrame(center: Float, top: Float, middle: Float, width: Float) -> Rect {
		
		let x = center - width.half
		let y = top
		let height = (middle - top).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterTopMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (middle - top).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, top: top, middle: middle, width: width)
		
	}
	
}
