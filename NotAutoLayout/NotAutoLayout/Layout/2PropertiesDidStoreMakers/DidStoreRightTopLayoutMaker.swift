//
//  DidStoreRightTopLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightTopLayoutProperty {
	
	let right: LayoutElement.Horizontal
	
	let top: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreRightTopLayoutProperty {
	
	private func makeFrame(right: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: CalculationParameters) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreRightTopMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreRightTopLayoutProperty>) -> LayoutMaker<DidStoreRightTopMiddleLayoutProperty> {
		
		let rightTopMiddle = DidStoreRightTopMiddleLayoutProperty(right: self.right,
																  top: self.top,
																  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTopMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreRightTopBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreRightTopLayoutProperty>) -> LayoutMaker<DidStoreRightTopBottomLayoutProperty> {
		
		let rightTopBottom = DidStoreRightTopBottomLayoutProperty(right: self.right,
																  top: self.top,
																  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTopBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreRightTopWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreRightTopLayoutProperty>) -> LayoutMaker<DidStoreRightTopWidthLayoutProperty> {
		
		let rightTopWidth = DidStoreRightTopWidthLayoutProperty(right: self.right,
																top: self.top,
																width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTopWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreRightTopHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreRightTopLayoutProperty>) -> LayoutMaker<DidStoreRightTopHeightLayoutProperty> {
		
		let rightTopHeight = DidStoreRightTopHeightLayoutProperty(right: self.right,
																  top: self.top,
																  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTopHeight)
		
		return maker
		
	}
	
}
