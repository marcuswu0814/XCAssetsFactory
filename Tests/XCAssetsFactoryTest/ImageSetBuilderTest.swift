import XCTest
import Foundation
import SwiftCLIToolbox
import PathKit
@testable import XCAssetsFactoryCore

class ImageSetBuilderTest: XCTestCase {
    
    let imageNamed = "ic_a"
    let expectedImageSet = TestEnv.xcassetsPath + Path("ic_a.imageset")
    lazy var expectedContentJson = expectedImageSet + Path("Contents.json")
    let expectedContentJsonString =
    """
        {
          "images" : [
            {
              "idiom" : "universal",
              "filename" : "ic_a.png",
              "scale" : "1x"
            },
            {
              "idiom" : "universal",
              "filename" : "ic_a@2x.png",
              "scale" : "2x"
            },
            {
              "idiom" : "universal",
              "filename" : "ic_a@3x.png",
              "scale" : "3x"
            }
          ],
          "info" : {
            "version" : 1,
            "author" : "xcode"
          }
        }
        """
    lazy var expected1xImage = expectedImageSet + Path(imageNamed + ".png")
    lazy var expected2xImage = expectedImageSet + Path(imageNamed + "@2x.png")
    lazy var expected3xImage = expectedImageSet + Path(imageNamed + "@3x.png")
    
    override func setUp() {
        super.setUp()
        
        TestEnv.setUp()
        Grouped().execute()
    }
    
    func test__givenXCAssetesPathAndImageDirPath__shouldMoveImageDirIntoXCAssetsToBeImageAssets() {
        let sut = ImageSetBuilder(with: TestEnv.xcassetsPath)
        sut.build(from: TestEnv.tempDir + Path("ic_a"))
       
        XCTAssertTrue(expectedImageSet.exists)
        XCTAssertTrue(expectedContentJson.exists)
        XCTAssertEqual(expectedContentJsonString, try? expectedContentJson.read())
        XCTAssertTrue(expected1xImage.exists)
        XCTAssertTrue(expected2xImage.exists)
        XCTAssertTrue(expected3xImage.exists)
    }
    
    func test__whenImageAssetsAlreadyExists__shouldMoveImageDirToCoverOldImageAssets() {
        XCTAssertFalse(expectedImageSet.exists)
        try? expectedImageSet.mkdir()
        XCTAssertTrue(expectedImageSet.exists)
        
        let sut = ImageSetBuilder(with: TestEnv.xcassetsPath)
        sut.build(from: TestEnv.tempDir + Path("ic_a"))
        
        XCTAssertTrue(expectedImageSet.exists)
        XCTAssertTrue(expectedContentJson.exists)
        XCTAssertEqual(expectedContentJsonString, try? expectedContentJson.read())
        XCTAssertTrue(expected1xImage.exists)
        XCTAssertTrue(expected2xImage.exists)
        XCTAssertTrue(expected3xImage.exists)
    }
    
    override func tearDown() {
        TestEnv.tearDown()
        
        super.tearDown()
    }
    
}

