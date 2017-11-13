//
//  BottomRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension BottomRightDidSetLayoutMaker {
	
	private func makeFrame(bottomRight: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - topCenter.x) * 2
		let height = bottomRight.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - middleCenter.x) * 2
		let height = (bottomRight.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomRight.x - size.width
		let y = bottomRight.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreTopLeftToEvaluateFrameType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let topLeft = topLeft.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, topLeft: topLeft)
	}
	
}

// MARK: TopCenter
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreTopCenterToEvaluateFrameType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, topCenter: topCenter)
	}
	
}

// MARK: MiddleLeft
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreMiddleLeftToEvaluateFrameType {
	
	public typealias WillSetMiddleLeftMaker = LayoutEditor
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let middleLeft = middleLeft.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleCenter
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreMiddleCenterToEvaluateFrameType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, middleCenter: middleCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = BottomRightLeftDidSetLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> BottomRightLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreCenterType {
	
	public typealias WillSetCenterMaker = BottomRightCenterDidSetLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> BottomRightCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 center: center)
		
	}
	
}

// MARK: Top
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = BottomRightTopDidSetLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> BottomRightTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 top: top)
		
	}
	
}

// MARK: Middle
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = BottomRightMiddleDidSetLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> BottomRightMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = BottomRightWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> BottomRightWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension BottomRightDidSetLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = BottomRightHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> BottomRightHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 height: height)
		
	}
	
}
