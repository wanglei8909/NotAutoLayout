//
//  LayoutView.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public class LayoutView: UIView {
	
	public typealias Condition = (CGSize) -> Bool
	public typealias LayoutMethod = (condition: (CGSize) -> Bool, position: Position)
	public typealias SubviewTuple = (view: UIView, layoutMethods: [LayoutMethod])
	
	public var layoutingSubviews: [SubviewTuple] = []
	
}

extension LayoutView {
	
	private func place(_ view: UIView, at position: Position) {
		
		let rect = position.absoluteRect(in: self.bounds.size)
		let centerX = rect.origin.x + (rect.width * 0.5)
		let centerY = rect.origin.y + (rect.height * 0.5)
		view.bounds.size = rect.size
		view.center = CGPoint(x: centerX, y: centerY)
		
	}
	
	private func layout(_ viewTuple: SubviewTuple) {
		
		for layoutMethod in viewTuple.layoutMethods {
			if layoutMethod.condition(self.bounds.size) == true {
				self.place(viewTuple.view, at: layoutMethod.position)
				break
			}
		}
		
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		
		self.layoutingSubviews.forEach { (tuple) in
			self.layout(tuple)
		}
		
	}
	
}

extension LayoutView {
	
	private func removeAllSubviews() {
		self.subviews.forEach { (view) in
			view.removeFromSuperview()
		}
	}
	
	private func addLayoutingSubviews() {
		self.layoutingSubviews.forEach { (view, _) in
			self.addSubview(view)
		}
	}
	
	public func reloadLayoutingSubviews() {
		
		self.removeAllSubviews()
		self.addLayoutingSubviews()
		
	}
	
}
