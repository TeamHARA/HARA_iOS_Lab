import UIKit

class HomeView: UIView {
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("프레임 \(frame)")
    }
    
    convenience init(_ edge: UIEdgeInsets) {
            let size = CGSize(width: 50, height: 50)
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            
            print("엣지 \(edge)")
            // Calculate maximum x and y coordinates within safe area
            let maxX = screenWidth - edge.left - edge.right - size.width
            let maxY = screenHeight - edge.top - edge.bottom - size.height
            
            // Generate random x and y coordinates within safe area
            let x = CGFloat(arc4random_uniform(UInt32(maxX))) + edge.left + 10
            let y = CGFloat(arc4random_uniform(UInt32(maxY))) + edge.top
            
            let rect = CGRect(origin: CGPoint(x: x, y: y), size: size)
            self.init(frame: rect)
            self.backgroundColor = .blue
        }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
