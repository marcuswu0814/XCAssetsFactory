import XCTest
import Foundation
import SwiftCLIToolbox
import PathKit
@testable import XCAssetsFactoryCore

class GroupedTest: XCTestCase {
    
    let tempDir = TestEnv.tempDir
    
    override func setUp() {
        super.setUp()
        
        TestEnv.setUp()
    }

    func test__whenFoundSamePrefixFiles__shouldPutIntoSameFolder() {
        let sut = Grouped()
        
        sut.execute()
        
        let aFolder = tempDir + Path("ic_a")
        let a = aFolder + Path("ic_a.png")
        let a2x = aFolder + Path("ic_a@2x.png")
        let a3x = aFolder + Path("ic_a@3x.png")
        
        let abFolder = tempDir + Path("ic_a_b")
        let ab = abFolder + Path("ic_a_b.png")
        let ab2x = abFolder + Path("ic_a_b@2x.png")
        let ab3x = abFolder + Path("ic_a_b@3x.png")
        
        XCTAssertTrue(aFolder.exists)
        XCTAssertTrue(a.exists)
        XCTAssertTrue(a2x.exists)
        XCTAssertTrue(a3x.exists)
        
        XCTAssertTrue(abFolder.exists)
        XCTAssertTrue(ab.exists)
        XCTAssertTrue(ab2x.exists)
        XCTAssertTrue(ab3x.exists)
    }
    
    override func tearDown() {
        TestEnv.tearDown()
        
        super.tearDown()
    }
    
}
