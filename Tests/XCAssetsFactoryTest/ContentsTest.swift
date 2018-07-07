import XCTest
import Foundation
import SwiftCLIToolbox
import PathKit
@testable import XCAssetsFactoryCore

class ContentsTest: XCTestCase {
    
    let tempDir = TestEnv.tempDir
    
    override func setUp() {
        super.setUp()
        
    }
    
    func test__givenImageName__createContesInfoJsonFile() {
        let imageNamed = "TestImageName"
        
        let result = ContentsFactory.make(by: imageNamed)
        
        let expected =
        """
        {
          "images" : [
            {
              "idiom" : "universal",
              "filename" : "TestImageName.png",
              "scale" : "1x"
            },
            {
              "idiom" : "universal",
              "filename" : "TestImageName@2x.png",
              "scale" : "2x"
            },
            {
              "idiom" : "universal",
              "filename" : "TestImageName@3x.png",
              "scale" : "3x"
            }
          ],
          "info" : {
            "version" : 1,
            "author" : "xcode"
          }
        }
        """
        
        XCTAssertEqual(result, expected)
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
}
