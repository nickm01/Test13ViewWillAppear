//
//  Test13ViewWillAppearTests.swift
//  Test13ViewWillAppearTests
//
//  Created by Nick McConnell on 12/16/19.
//  Copyright © 2019 Nick McConnell. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Test13ViewWillAppear

func presentViewController(_ viewController: UIViewController) {
    
    let windows = UIApplication.shared.windows
    windows.forEach { window in
        if let presentedViewController = window.rootViewController?.presentedViewController {
            presentedViewController.dismiss(animated: false, completion: nil)
        }
        
        window.isHidden = true
    }
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.layer.speed = 10
    viewController.modalPresentationStyle = .fullScreen
    viewController.beginAppearanceTransition(true, animated: false)
    window.rootViewController = viewController
    window.makeKeyAndVisible()
    viewController.endAppearanceTransition()
}

final class MyTests: QuickSpec {
    override func spec() {
        super.spec()
        it("test") {
            let vc = ViewController()
            let _ = vc.view
            vc.modalPresentationStyle = .fullScreen
            presentViewController(vc)
            
            XCTAssert(vc.viewDidLoadCalled == true)
            XCTAssert(vc.viewWillAppearCalled == true)
            
            // This is the line that fails in 1.13
            XCTAssert(vc.viewDidAppearCalled == true)

            //expect(vc.viewWillAppearCalled).to(equal(true))
            //expect(vc.viewDidAppearCalled).toEventually(equal(true))
            //XCTAssert(vc.viewDidAppearCalled == true)
        }
    }
}

//class Test13ViewWillAppearTests: XCTestCase {
//
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func presentViewController(_ viewController: UIViewController) {
//
//           let windows = UIApplication.shared.windows
//           windows.forEach { window in
//               if let presentedViewController = window.rootViewController?.presentedViewController {
//                   presentedViewController.dismiss(animated: false, completion: nil)
//               }
//
//               window.isHidden = true
//           }
//
//           let window = UIWindow(frame: UIScreen.main.bounds)
//           window.layer.speed = 10
//           viewController.modalPresentationStyle = .fullScreen
//           viewController.beginAppearanceTransition(true, animated: false)
//           window.rootViewController = viewController
//           window.makeKeyAndVisible()
//           viewController.endAppearanceTransition()
//       }
//
//    func testViewController() {
//        let vc = ViewController()
//        let _ = vc.view
//        presentViewController(vc)
//
//        XCTAssert(vc.viewDidLoadCalled == true)
//        XCTAssert(vc.viewWillAppearCalled == true)
//
//    }
//}
