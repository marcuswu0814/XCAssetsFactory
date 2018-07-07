import XCTest
import Foundation
import SwiftCLIToolbox
import PathKit
@testable import XCAssetsFactoryCore

class MakeImageSetsE2ETest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        TestEnv.setUp()
        Grouped().execute()
    }
    
    func test__whenFoundCurrentDirHadImageDirs__shouldPutIntoXCAssets() {
        let sut = MakeImageSets(with: TestEnv.xcassetsPath)
        sut.execute()
        
        let icaImageSet = TestEnv.xcassetsPath + Path("ic_a.imageset")
        let icabImageSet = TestEnv.xcassetsPath + Path("ic_a.imageset")

        XCTAssertTrue(icaImageSet.exists)
        XCTAssertTrue(icabImageSet.exists)
    }
    
    override func tearDown() {
        TestEnv.tearDown()
        
        super.tearDown()
    }

}
