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
    @IBInspectable private var srirachaStrokeColor: UIColor = .orange
    @IBInspectable private var tomatofillColor: UIColor = .red
    @IBInspectable private var cornerRadius: CGFloat = 5
    
    override func draw(_ rect: CGRect) {
        let width = bounds.width
        let height = bounds.height
        
        // 위 번 그리기
        drawTopBun(width, height)
        
        // 스리라차 소스 그리기
        drawSriracha(width, height)
        
        // 토마토 2개 그리기
        drawTomatoes(width, height)
        
        // 양상추 4번 그리기
        drawLettuce(width, height)
        
        // 고기 패티 그리기
        drawMeatPatty(width, height)
        
        // 아래 번 그리기
        drawBottomBun(width, height)
    }
    
    private func drawTopBun(_ width: CGFloat, _ height: CGFloat) {
        let topBunStartPoint = CGPoint(x: width * 0.12, y: height * 0.43)
        let topBunEndPoint = CGPoint(x: width * 0.88, y: height * 0.43)
        
        let topBun = UIBezierPath()
        topBun.lineWidth = lineWidth
        topBun.lineJoinStyle = .round
        topBun.move(to: topBunStartPoint)
        topBun.addCurve(to: topBunEndPoint,
                        controlPoint1: CGPoint(x: width * 0.15, y: height * 0.25),
                        controlPoint2: CGPoint(x: width * 0.85, y: height * 0.25)
        )
        topBun.addLine(to: topBunStartPoint)
        topBun.lineWidth = lineWidth
        topBun.lineJoinStyle = .round
        bunStrokeColor.setStroke()
        topBun.close() // close 위치를 stroke 위로 올리면, 선분들의 joint 가 잘 형성됨
        topBun.stroke()
    }
    
    private func drawSriracha(_ width: CGFloat, _ height: CGFloat) {
        let srirachaStartPoint = CGPoint(x: width * 0.12, y: height * 0.45)
        let srirachaEndPoint = CGPoint(x: width * 0.16, y: height * 0.47)
        
        let sriracha = UIBezierPath()
        sriracha.lineWidth = 10
        sriracha.lineCapStyle = .square
        
        var srirachaGap: CGFloat = 0
        for _ in 1...13 {
            sriracha.move(to: CGPoint(x: srirachaStartPoint.x + srirachaGap, y: srirachaStartPoint.y))
            sriracha.addLine(to: CGPoint(x: srirachaEndPoint.x + srirachaGap, y: srirachaEndPoint.y))
            srirachaGap += 25
        }
        srirachaStrokeColor.setStroke()
        sriracha.stroke()
        sriracha.close()
    }
    
    private func drawTomatoes(_ width: CGFloat, _ height: CGFloat) {
        let tomatoOneOrigin = CGPoint(x: width * 0.13, y: height * 0.49)
        let tomatoTwoOrigin = CGPoint(x: width * 0.52, y: height * 0.49)
        let tomatoSize = CGSize(width: width * 0.35, height: height * 0.03)
        
        let tomatoOne = UIBezierPath(
            rect: CGRect(
                origin: tomatoOneOrigin,
                size: tomatoSize
            )
        )
        tomatofillColor.setFill()
        tomatoOne.fill()
        tomatoOne.close()
        
        let tomatoTwo = UIBezierPath(
            rect: CGRect(
                origin: tomatoTwoOrigin,
                size: tomatoSize
            )
        )
        tomatofillColor.setFill()
        tomatoTwo.fill()
        tomatoTwo.close()
    }
    
    private func drawLettuce(_ width: CGFloat, _ height: CGFloat) {
        let lettuceStartPoint = CGPoint(x: width * 0.12, y: height * 0.55)
        
        let lettuce = UIBezierPath()
        lettuce.lineWidth = 20
        lettuce.lineCapStyle = .round
        
        var lettuceGap: CGFloat = 0
        lettuce.move(to: lettuceStartPoint)
        for _ in 1...4 {
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
    }
    
    private func drawMeatPatty(_ width: CGFloat, _ height: CGFloat) {
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
    }
    
    private func drawBottomBun(_ width: CGFloat, _ height: CGFloat) {
        let bottomBunOrigin = CGPoint(x: width * 0.12, y: height * 0.64)
        let bottomBunSize = CGSize(width: width * 0.76, height: height * 0.05)
        
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
    }
}
