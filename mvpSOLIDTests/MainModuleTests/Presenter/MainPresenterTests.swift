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
    var presenter: MainPresenter!
    var networkManager: NetworkManagerProtocol!
    var router: RouterProtocol!
    var comments: [Comment] = []
    
    
    override func setUpWithError() throws {
        let nav = UINavigationController()
        let assembly = AssemblyModuleBuilder()
        router = Router(navigationController: nav, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        view = nil
        networkManager = nil
        presenter = nil
    }

    func testGetSuccessComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        
        view = MockView()
        networkManager = MockNetworkManager(comments: [comment])
        presenter = MainPresenter(view: view, networkManager: networkManager, router: router)
        
        var catchComments: [Comment]?
        
        networkManager.fetchComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        XCTAssertNotEqual(catchComments?.count, 0)
        XCTAssertEqual(catchComments?.count, comments.count)
    }
    
    func testGetFailureComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        
        view = MockView()
        networkManager = MockNetworkManager()
        presenter = MainPresenter(view: view, networkManager: networkManager, router: router)
        
        var catchError: Error?
        
        networkManager.fetchComments { result in
            switch result {
            case .success( _):
                break
            case .failure(let error):
                catchError = error
            }
        }
        
        XCTAssertNotNil(catchError)
    }
}

extension MainPresenterTests {
    class MockView: MainViewProtocol {
        func success() {
        }
        
        func failure(error: Error) {
        }
    }
    
    class MockNetworkManager: NetworkManagerProtocol {
        var comments: [Comment]!
        
        init() {}
        
        convenience init(comments: [Comment]?) {
            self.init()
            self.comments = comments
        }
        
        func fetchComments(completion: @escaping (Result<[mvpSOLID.Comment], Error>) -> Void) {
            if let comments = comments {
                completion(.success(comments))
            } else {
                let error = NSError(domain: "", code: 0, userInfo: nil)
                completion(.failure(error))
            }
        }
    }
}
