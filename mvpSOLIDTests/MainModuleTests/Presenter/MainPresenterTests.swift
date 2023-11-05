//
//  MainPresenterTests.swift
//  mvpSOLIDTests
//
//  Created by Goodwasp on 05.11.2023.
//

import XCTest
@testable import mvpSOLID

final class MainPresenterTests: XCTestCase {

    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!
    
    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Foo", lastName: "Baz")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view)
        XCTAssertNotNil(person)
        XCTAssertNotNil(presenter)
    }
    
    func testShowGreeting() {
        presenter.showGreeting()
        XCTAssertEqual(view.title, "Foo" + " " + "Baz")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Foo")
        XCTAssertEqual(person.lastName, "Baz")
    }
}

extension MainPresenterTests {
    class MockView: MainViewProtocol {
        var title: String?
        
        func set(greeting: String) {
            title = greeting
        }
    }
}
