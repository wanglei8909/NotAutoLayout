//
//  ViewLayoutGuideTest.swift
//  NotAutoLayoutTests
//
//  Created by 史 翔新 on 2018/05/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class ViewLayoutGuidesTest: XCTestCase {
	
	private let vc = TestViewController()
	private var guides: ViewLayoutGuides {
		return self.vc.view.nal.layoutGuides
	}
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultGuide() {
		
		let guide = self.guides
		
		XCTAssertEqual(guide.left, 0)
		XCTAssertEqual(guide.center, 400)
		XCTAssertEqual(guide.right, 800)
		XCTAssertEqual(guide.top, 0)
		XCTAssertEqual(guide.middle, 300)
		XCTAssertEqual(guide.bottom, 600)
		
		XCTAssertEqual(guide.width, 800)
		XCTAssertEqual(guide.height, 600)
		
		XCTAssertEqual(guide.horizontal(at: 0.4), 0 + (800 * 0.4))
		XCTAssertEqual(guide.vertical(at: 0.7), 0 + (600 * 0.7))
		
		XCTAssertEqual(guide.topLeft, .init(x: guide.left, y: guide.top))
		XCTAssertEqual(guide.topCenter, .init(x: guide.center, y: guide.top))
		XCTAssertEqual(guide.topRight, .init(x: guide.right, y: guide.top))
		XCTAssertEqual(guide.middleLeft, .init(x: guide.left, y: guide.middle))
		XCTAssertEqual(guide.middleCenter, .init(x: guide.center, y: guide.middle))
		XCTAssertEqual(guide.middleRight, .init(x: guide.right, y: guide.middle))
		XCTAssertEqual(guide.bottomLeft, .init(x: guide.left, y: guide.bottom))
		XCTAssertEqual(guide.bottomCenter, .init(x: guide.center, y: guide.bottom))
		XCTAssertEqual(guide.bottomRight, .init(x: guide.right, y: guide.bottom))
		
		XCTAssertEqual(guide.point(at: .init(x: 0.6, y: 0.9)), Point(x: guide.horizontal(at: 0.6), y: guide.vertical(at: 0.9)))
		XCTAssertEqual(guide.size, .init(width: guide.width, height: guide.height))
		XCTAssertEqual(guide.frame, .init(x: 0, y: 0, width: 800, height: 600))
		
		let insets = Insets(top: 100, left: 200, bottom: 300, right: 400)
		XCTAssertEqual(guide.frame(inside: insets), Rect(x: 200, y: 100, width: 800 - (200 + 400), height: 600 - (100 + 300)))
		
    }
    
    func testPerformanceExample() {
		
        self.measure {
            _ = self.guides.layoutMarginsGuide.frame
        }
		
    }
    
}

private final class TestViewController: UIViewController {
	
	override func loadView() {
		let view = UIView(frame: .init(x: 0, y: 0, width: 800, height: 600))
		self.view = view
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.layoutMargins = .init(top: 10, left: 20, bottom: 30, right: 40)
		if #available(iOS 11.0, *) {
			self.additionalSafeAreaInsets = .init(top: 110, left: 120, bottom: 130, right: 140)
			self.view.insetsLayoutMarginsFromSafeArea = true
		}
	}
	
}
