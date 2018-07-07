import Foundation
import SwiftCLIToolbox
import PathKit

class TestEnv {
    
    static let tempDir = Path("/tmp/XCAssetsFactory")
   
    static let xcassetsPath = Path("/tmp/XCAssetsFactory/XCAssetsFactoryTest.xcassets")
    
    class func setUp() {
        try? tempDir.mkdir()
        
        Path.current = tempDir
        
        _ = Bash.run("touch", arguments: ["ic_a.png"])
        _ = Bash.run("touch", arguments: ["ic_a@2x.png"])
        _ = Bash.run("touch", arguments: ["ic_a@3x.png"])
        
        _ = Bash.run("touch", arguments: ["ic_a_b.png"])
        _ = Bash.run("touch", arguments: ["ic_a_b@2x.png"])
        _ = Bash.run("touch", arguments: ["ic_a_b@3x.png"])
        
        try? xcassetsPath.mkdir()
    }
    
    class func tearDown() {
        try? tempDir.delete()
        try? xcassetsPath.delete()
    }
    
}

