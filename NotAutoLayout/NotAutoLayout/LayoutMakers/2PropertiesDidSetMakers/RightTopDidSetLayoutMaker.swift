//
//  RightTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct RightTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension RightTopDidSetLayoutMaker {
	
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
extension RightTopDidSetLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: parameter)
		let top = self.top.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension RightTopDidSetLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = RightTopMiddleDidSetLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> RightTopMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension RightTopDidSetLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = RightTopBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> RightTopBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension RightTopDidSetLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = RightTopWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> RightTopWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 width: width)
		
	}
	
}

// MARK: Height
extension RightTopDidSetLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = RightTopHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> RightTopHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 height: height)
		
	}
	
}
