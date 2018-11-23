//
//  FlikrPresenterTest.swift
//  UberCTTests
//
//  Created by Anand on 23/11/18.
//  Copyright © 2018 Anand. All rights reserved.
//

import XCTest
@testable import UberCT

class FlikrPresenterTest: XCTestCase {
    
    let mockViewController: MockFlikrViewController = MockFlikrViewController()
    let mockInteractor: MockFlikrInteractor = MockFlikrInteractor()
    let sut = FlikrPhotoSearchPresenter()
    
    override func setUp() {
        super.setUp()
        sut.view = mockViewController
        sut.interactor = mockInteractor
        sut.viewModel = FlikrPhotosViewModel.init(searchText: "Kitten", page: 1)
        sut.viewModel.photos = PhotosLoader.photos()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_setup_ui_on_viewDidLoad() {
        //Arrange
        
        //Act
        sut.viewDidLoad()
        
        //Assert
        XCTAssertGreaterThan(mockViewController.setupUICallCount, 0)
    }
    
    func test_numberofitems() {
        //Arrange
        
        //Act
        let result = sut.numberOfItems()
        
        //Assert
        XCTAssertEqual(result, 3)
        
    }
    
    func test_numberofitems_when_no_photos() {
        //Arrange
        sut.viewModel.photos = []
        
        //Act
        let result = sut.numberOfItems()
        
        //Assert
        XCTAssertEqual(result, 0)
    }
    
    func test_item_at_index_1() {
        //Arrange
        let indexPath = IndexPath.init(item: 1, section: 0)
        //Act
        let result = sut.item(at: indexPath)
        
        //Assert
        XCTAssertEqual(result?.id, "2")
        
    }
    
    func test_fetch_photos() {
        //Arrange
        
        //Act
        sut.fetchPhotos(with: "Kitten")
        
        //Assert
        XCTAssertEqual(mockViewController.showHudCallCount, 1)
        XCTAssertEqual(mockInteractor.fetchCallCount, 1)
    }
    
    func test_fetch_photos_with_nil() {
        //Arrange
        
        //Act
        sut.fetchPhotos(with: nil)
        
        //Assert
        XCTAssertEqual(mockInteractor.fetchCallCount, 0)
    }
    
    func test_loadmore() {
        //Arrange
        let indexPath = IndexPath.init(item: 2, section: 0)
        
        //Act
        sut.loadMore(for: indexPath)
        
        //Assert
        XCTAssertEqual(mockInteractor.fetchCallCount, 1)
        
    }
    
    func test_should_not_loadmore_if_no_items() {
        //Arrange
        let indexPath = IndexPath.init(item: 2, section: 0)
        sut.loadedAll = true
        
        //Act
        sut.loadMore(for: indexPath)
        
        //Assert
        XCTAssertEqual(mockInteractor.fetchCallCount, 0)
        
    }
    
    func test_finish_loading_photos() {
        //Arrange
        
        //Act
        sut.didFinishLoadingSuccess(photos: PhotosLoader.photos())
        let viewModelPhotos = sut.viewModel.photos
        
        //Assert
        XCTAssertEqual(mockViewController.hideCallCount, 1)
        XCTAssertEqual(mockViewController.reloadCallCount, 1)
        XCTAssertEqual(viewModelPhotos.count, 6)

    }
    
    func test_finish_loading_photos_with_no_photos() {
        //Arrange
        
        //Act
        sut.didFinishLoadingSuccess(photos: [])
        let viewModelPhotos = sut.viewModel.photos
        let result = sut.loadedAll
        
        //Assert
        XCTAssertEqual(mockViewController.hideCallCount, 1)
        XCTAssertEqual(mockViewController.reloadCallCount, 0)
        XCTAssertEqual(viewModelPhotos.count, 3)
        XCTAssertEqual(result, true)
        
    }
    
    func test_fail_load_photos() {
        //Act
        sut.didFinishLoadingFailed(photos: nil)
        //Arrange
        XCTAssertEqual(mockViewController.hideCallCount, 1)
    }
    
    func test_request_in_process() {
        //Act
        sut.requestInProcess()
        
        //Arrange
        XCTAssertEqual(mockViewController.hideCallCount, 1)
    }
    
    
}
