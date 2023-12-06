//
//  RouterTests.swift
//  mvpSOLIDTests
//
//  Created by Goodwasp on 06.12.2023.
//

import XCTest
@testable import mvpSOLID

final class RouterTests: XCTestCase {

    var router: RouterProtocol!
    let navigationController = MockNavigationController()
    let assembly = AssemblyModuleBuilder()
    
    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }
    
    func testRouter() {
        router.showDetail(comment: nil)
        let detailVC = navigationController.presentedVC
        
        XCTAssertTrue(detailVC is DetailViewController)
    }
}

extension RouterTests {
    class MockNavigationController: UINavigationController {
        var presentedVC: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            self.presentedVC = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
}
