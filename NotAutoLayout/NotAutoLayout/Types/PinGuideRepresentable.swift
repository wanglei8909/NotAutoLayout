//
//  PinGuideRepresentable.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol HorizontalPinGuideRepresentable {
	
	var pinGuide: ViewPinGuides.HorizontalGuide { get }
	
	var left: CGFloat { get }
	
	var center: CGFloat { get }
	
	var right: CGFloat { get }
	
	func horizontal(at relativePosition: CGFloat) -> CGFloat
	
	var leading: CGFloat { get }
	
	var trailing: CGFloat { get }
	
}

public protocol VerticalPinGuideRepresentable {
	
	var pinGuide: ViewPinGuides.VerticalGuide { get }
	
	var top: CGFloat { get }
	
	var middle: CGFloat { get }
	
	var bottom: CGFloat { get }
	
	func vertical(at relativePosition: CGFloat) -> CGFloat
	
}

public protocol PointPinGuideRepresentable {
	
	var pinGuide: ViewPinGuides.PointGuide { get }
	
	var topLeft: CGPoint { get }
	
	var topCenter: CGPoint { get }
	
	var topRight: CGPoint { get }
	
	var middleLeft: CGPoint { get }
	
	var middleCenter: CGPoint { get }
	
	var middleRight: CGPoint { get }
	
	var bottomLeft: CGPoint { get }
	
	var bottomCenter: CGPoint { get }
	
	var bottomRight: CGPoint { get }
	
	func point(at relativePosition: CGPoint) -> CGPoint
	
	func pointAt(x: CGFloat, y: CGFloat) -> CGPoint
	
	var topLeading: CGPoint { get }
	
	var topTrailing: CGPoint { get }
	
	var midddleLeading: CGPoint { get }
	
	var middleTrailing: CGPoint { get }
	
	var bottomLeading: CGPoint { get }
	
	var bottomTrailing: CGPoint { get }
	
}

extension HorizontalPinGuideRepresentable {
	
	public var left: CGFloat {
		return self.pinGuide.left
	}
	
	public var center: CGFloat {
		return self.pinGuide.center
	}
	
	public var right: CGFloat {
		return self.pinGuide.right
	}
	
	public func horizontal(at relativePosition: CGFloat) -> CGFloat {
		return self.pinGuide.horizontal(at: relativePosition)
	}
	
	public var leading: CGFloat {
		return self.pinGuide.leading
	}
	
	public var trailing: CGFloat {
		return self.pinGuide.trailing
	}
	
}

extension VerticalPinGuideRepresentable {
	
	public var top: CGFloat {
		return self.pinGuide.top
	}
	
	public var middle: CGFloat {
		return self.pinGuide.middle
	}
	
	public var bottom: CGFloat {
		return self.pinGuide.bottom
	}
	
	public func vertical(at relativePosition: CGFloat) -> CGFloat {
		return self.pinGuide.vertical(at: relativePosition)
	}
	
}
