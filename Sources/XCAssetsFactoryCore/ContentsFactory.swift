import Foundation
import PathKit

class ContentsFactory {
   
    class func make(by imageName: String) -> String {
        let imageInfo = ImageInfo(idiom: "universal" ,filename: imageName + ".png", scale: "1x")
        let imageInfo2x = ImageInfo(idiom: "universal" ,filename: imageName + "@2x.png", scale: "2x")
        let imageInfo3x = ImageInfo(idiom: "universal" ,filename: imageName + "@3x.png", scale: "3x")

        let contents = Contents(images: [imageInfo, imageInfo2x, imageInfo3x],
                                info: ContentsInfo(version: 1, author: "xcode"))
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        let data = try! encoder.encode(contents)
        
        return String(data: data, encoding: .utf8)!
    }
    
}

