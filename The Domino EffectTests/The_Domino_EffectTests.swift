//
//  The_Domino_EffectTests.swift
//  The Domino EffectTests
//
//  Created by Adam McFry on 4/11/21.
//  Copyright © 2021 Adam McFry. All rights reserved.
//

import XCTest

class The_Domino_Effect_DominoManager_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        DominoManager.shared.initializeDominos()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        DominoManager.shared.resetDominos()
    }

    /**
     Calls sort on a sample set of dominos and verifies the count of the sort.
     */
    func testSort_SampleSet1(){
        DominoManager.shared.leadDomino = 9;
        let testSet:[Domino] = [Domino(head: 2, tail: 3, isSelected: true, clicked: true, imageName: "Orange Dominos Non-Glow Set-03"),
                                Domino(head: 2, tail: 5, isSelected: true, clicked: true, imageName: "Orange Dominos Non-Glow Set-05"),
                                Domino(head: 9, tail: 5, isSelected: true, clicked: true, imageName: "Pink Dominos Non-Glow Set-05"),
                                Domino(head: 5, tail: 7, isSelected: true, clicked: true, imageName: "Forest Green Dominos Non-Glow Set-07"),
                                Domino(head: 8, tail: 1, isSelected: true, clicked: true, imageName: "Purple Dominos Non-Glow Set-01"),
                                Domino(head: 9, tail: 8, isSelected: true, clicked: true, imageName: "Pink Dominos Non-Glow Set-08"),
                                Domino(head: 9, tail: 3, isSelected: true, clicked: true, imageName: "Pink Dominos Non-Glow Set-03"),
                                Domino(head: 5, tail: 6, isSelected: true, clicked: true, imageName: "Forest Green Dominos Non-Glow Set-06"),
                                Domino(head: 6, tail: 4, isSelected: true, clicked: true, imageName: "Aqua Dominos Non-Glow Set-04")]
        let paths = DominoManager.shared.sortDominos(dominosToSort: testSet)
        XCTAssertEqual(6, paths.count, "Result of sorting should return 6")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
