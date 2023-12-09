import UIKit

extension UIView {
    
    // for anchors
    func anchor(top: NSLayoutYAxisAnchor? = nil , left : NSLayoutXAxisAnchor? = nil,
                bottom : NSLayoutYAxisAnchor? = nil , right : NSLayoutXAxisAnchor? = nil ,
                paddingTop : CGFloat = 0,
                paddingLeft : CGFloat = 0,
                paddingBottom : CGFloat = 0,
                paddingRight : CGFloat = 0,
                centerX : NSLayoutXAxisAnchor? = nil,
                centerY : NSLayoutYAxisAnchor? = nil,
                width : NSLayoutDimension? = nil,
                height : NSLayoutDimension? = nil,
                widthMultiplier : CGFloat? = nil,
                heightMultiplier : CGFloat? = nil
        )
    {
            translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let width = width  {
            widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier ?? 1).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier ?? 1).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func addSubViews(_ views: UIView...){
        for view in views{
            addSubview(view)
        }
    }
    
    func enableConstraints(_ views: UIView...){
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
