import Foundation
import Commander
import XCAssetsFactoryCore
import PathKit

Group {
    
    $0.command("grouped") {
        Grouped().execute()
    }
    
    let makeImaggeSetsCommand = command(Argument<String>("xcassetsPath", description: "Your specifice xcassets folder path")) { (xcassetsPath) in
        MakeImageSets(with: Path(xcassetsPath)).execute()
    }
    
    $0.addCommand("make-imagesets", makeImaggeSetsCommand)

}.run()
