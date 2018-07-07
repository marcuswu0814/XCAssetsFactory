import Foundation
import PathKit

class ImageSetBuilder {
    
    var xcassetsPath: Path
    
    init (with xcassetsPath: Path) {
        self.xcassetsPath = xcassetsPath
    }
    
    func build(from imageFolderPath: Path) {
        let imageName = imageFolderPath.lastComponent
        let imageSetPath = xcassetsPath + Path(imageName + ".imageset")
        
        if imageSetPath.exists {
            try? imageSetPath.delete()
        }

        try? imageFolderPath.move(imageSetPath)
        
        let contents = ContentsFactory.make(by: imageName)
        let contentsJsonPath = imageSetPath + Path("Contents.json")
        try? contentsJsonPath.write(contents)
    }
    
}
