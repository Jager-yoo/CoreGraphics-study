//
//  BurgerView.swift
//  CGHamburgerPractice
//
//  Created by 유재호 on 2022/02/19.
//

import UIKit

@IBDesignable
final class BurgerView: UIView {
    
    @IBInspectable private var lineWidth: CGFloat = 10
    @IBInspectable private var bunStrokeColor: UIColor = .brown
    @IBInspectable private var lettuceStrokeColor: UIColor = .green
    @IBInspectable private var tomatofillColor: UIColor = .red
    @IBInspectable private var cornerRadius: CGFloat = 5
    
    override func draw(_ rect: CGRect) {
//        self.layer.borderWidth = 2
//        self.layer.borderColor = UIColor.opaqueSeparator.cgColor
//        self.layer.cornerRadius = cornerRadius
        
        let height = bounds.height
        let width = bounds.width
        
        // 아래 번 그리기
        let bottomBunOrigin = CGPoint(x: width * 0.15, y: height * 0.64)
        let bottomBunSize = CGSize(width: width * 0.7, height: height * 0.05)
        
        let bottomBun = UIBezierPath(
            roundedRect: CGRect(
                origin: bottomBunOrigin,
                size: bottomBunSize
            ),
            cornerRadius: cornerRadius
        )
        bottomBun.lineWidth = lineWidth
        bunStrokeColor.setStroke()
        bottomBun.stroke()
        bottomBun.close()
        
        // 고기 패티 그리기
        let meatPattyStartPoint = CGPoint(x: width * 0.12, y: height * 0.6)
        let meatPattyEndPoint = CGPoint(x: width * 0.88, y: height * 0.6)
        
        let meatPatty = UIBezierPath()
        meatPatty.lineWidth = 40
        meatPatty.lineCapStyle = .round
        meatPatty.move(to: meatPattyStartPoint)
        meatPatty.addLine(to: meatPattyEndPoint)
        bunStrokeColor.setStroke()
        meatPatty.stroke()
        meatPatty.close()
        
        // 양상추 그리기
        let lettuceStartPoint = CGPoint(x: width * 0.12, y: height * 0.55)
        
        let lettuce = UIBezierPath()
        lettuce.lineWidth = 20
        lettuce.lineCapStyle = .round
        
        var lettuceGap: CGFloat = 0
        for _ in 1...4 {
            lettuce.move(to: CGPoint(x: lettuceStartPoint.x + lettuceGap, y: lettuceStartPoint.y))
            lettuce.addCurve(
                to: CGPoint(x: lettuceStartPoint.x + 80 + lettuceGap, y: lettuceStartPoint.y),
                controlPoint1: CGPoint(x: lettuceStartPoint.x + 40 + lettuceGap, y: lettuceStartPoint.y + 30),
                controlPoint2: CGPoint(x: lettuceStartPoint.x + 40 + lettuceGap, y: lettuceStartPoint.y - 30)
            )
            lettuceGap += 80
        }
        lettuceStrokeColor.setStroke()
        lettuce.stroke()
        lettuce.close()
        
        // 토마토 그리기
        let tomatoOrigin = CGPoint(x: width * 0.13, y: height * 0.49)
        let tomatoSize = CGSize(width: width * 0.35, height: height * 0.03)
        
        let tomato = UIBezierPath(
            rect: CGRect(
                origin: tomatoOrigin,
                size: tomatoSize
            )
        )
        tomatofillColor.setFill()
        tomato.fill()
        tomato.close()
    }
}
