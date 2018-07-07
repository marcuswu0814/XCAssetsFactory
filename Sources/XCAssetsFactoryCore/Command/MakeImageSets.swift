import Foundation
import PathKit
import SwiftCLIToolbox

public class MakeImageSets: CommandProtocol {
    
    var xcassetsPath: Path
    
    public init(with xcassetsPath: Path) {
        self.xcassetsPath = xcassetsPath
    }
    
    public func execute() {
        Bash.run("ls", arguments: nil)?
            .split(separator: "\n")
            .map { Path(String($0)) }
            .filter { $0.isDirectory }
            .forEach { ImageSetBuilder(with: xcassetsPath).build(from: $0) }
    }
    
}
