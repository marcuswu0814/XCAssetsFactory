import Foundation
import PathKit
import SwiftCLIToolbox

public class Grouped: CommandProtocol {
    
    public init() {}
    
    public func execute() {
        let fileList = Bash.run("ls", arguments: nil)
        let files = fileList?.split(separator: "\n")
        
        let pureFilesName = files?.filter { !($0.is2x || $0.is3x) }.map { $0.removeExtension() }
        
        let currentPath = Path.current
        
        pureFilesName?.forEach { filename in
            let dirPath = currentPath + filename
            
            mkdir(with: dirPath)
            
            _ = Bash.run("mv", arguments: [dirPath.string + ".png", dirPath.string])
            _ = Bash.run("mv", arguments: [dirPath.string + "@2x.png", dirPath.string])
            _ = Bash.run("mv", arguments: [dirPath.string + "@3x.png", dirPath.string])
        }
    }
    
    private func mkdir(with dirPath: Path) {
        if !dirPath.exists {
            try? dirPath.mkdir()
        }
    }
    
}

private extension Substring {
    
    var is2x: Bool {
        return self.hasSuffix("@2x.png")
    }
    
    var is3x: Bool {
        return self.hasSuffix("@3x.png")
    }
    
    func removeExtension() -> String {
        return String(self.split(separator: ".")[0])
    }
    
}
