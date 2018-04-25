//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyView: UIView {
    
   
    override func draw(_ rect: CGRect) {
        
        let context=UIGraphicsGetCurrentContext()
        let pathRect=rect.insetBy(dx:rect.size.width*0.1,dy:rect.size.height*0.1)
        let cornerRadius:CGFloat=20.0
        let rotationTransform=CGAffineTransform(rotationAngle: CGFloat(Double.pi)/0.5)
        let rectanglePath=UIBezierPath(roundedRect:pathRect,cornerRadius:cornerRadius)
        context!.saveGState()
        context!.concatenate(rotationTransform)
        UIColor.red.setFill()
        rectanglePath.fill()
        context!.restoreGState()
//        let colorSpace=CGColorSpaceCreateDeviceRGB()
//        let gradientStartColor=UIColor(red:0.1,green:0.1,blue:0.1,alpha:1)
//        let gradientEndColor=UIColor(red:1,green:0.6,blue:0.8,alpha:1)
//        let gradientColors=[gradientStartColor.cgColor,gradientEndColor.cgColor] as CFArray
//        let gradientLocations:[CGFloat]=[0.0,1.0]
//        let gradient=CGGradient(colorsSpace: colorSpace,colors: gradientColors ,locations: gradientLocations)
//
//        let pathRect=rect.insetBy(dx: 20, dy: 20)
//        let topPoint=CGPoint(x:pathRect.width/2,y:20)
//        let bottomPoint=CGPoint(x:pathRect.width/2,y:pathRect.height-20)
//
//        let roundedRectanglePath=UIBezierPath(roundedRect:pathRect,cornerRadius:4)
//        context!.saveGState()
//        roundedRectanglePath.addClip()
//        context!.drawLinearGradient(gradient!, start: bottomPoint, end: topPoint, options: CGGradientDrawingOptions(rawValue: 0))
//        context!.restoreGState()
//        let pathRect=rect.insetBy(dx: self.bounds.size.width*0.1, dy: self.bounds.size.height*0.1)
//        let rectanglePath=UIBezierPath(roundedRect:pathRect,cornerRadius:20)
//        context!.saveGState()
//
//        let shadow=UIColor.black.cgColor
//        let shadowOffset=CGSize(width:3,height:3)
//        let shadowBlurRadius:CGFloat=5.0
//
//        context!.setShadow(offset:shadowOffset,blur:shadowBlurRadius,color:shadow)
//        UIColor.red.setFill()
//        rectanglePath.fill()
//        context!.restoreGState()
//        let bezierPath=UIBezierPath()
//
//        let squareRect=rect.insetBy(dx:rect.size.width*0.45,dy:rect.size.height*0.05)
//        let circleRect=rect.insetBy(dx:rect.size.width*0.3,dy:rect.size.height*0.3)
//        let cornerRadius:CGFloat=20
//
//        let circlePath=UIBezierPath(ovalIn:circleRect)
//        let squarePath=UIBezierPath(roundedRect:squareRect,cornerRadius:cornerRadius)
//
//        squarePath.append(circlePath)
//        bezierPath.append(squarePath)
//        UIColor.red.setFill()
//        UIColor.black.setStroke()
//        bezierPath.lineWidth=1
//        bezierPath.fill()
//        bezierPath.stroke()
    }
}
class MyViewController : UIViewController {
    override func loadView() {
        let viewRect=CGRect(x:0,y:0,width:200,height:200)
        let view = MyView(frame:viewRect)
        view.backgroundColor = .white

        
        //  view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


