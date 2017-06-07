//
//  SecondViewController.swift
//  CameraPicker
//
//  Created by LimeTray on 06/06/17.
//  Copyright © 2017 none. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var burgerKingLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tapGesture = UIPanGestureRecognizer(target: self, action: #selector(SecondViewController.logoPanned))
//        burgerKingLogo.addGestureRecognizer(tapGesture)
    }
    
    func rand() -> CGFloat {
        return CGFloat(Double(arc4random()).truncatingRemainder(dividingBy: 255)/255.0)
    }
    
    @IBAction func logoLongPressed(_ recognizer: UILongPressGestureRecognizer) {
        let sheet = UIAlertController(title: "Cancel?", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (alert: UIAlertAction!) in
            print("Cancelled")
        }
        sheet.addAction(action)
        self.present(sheet, animated: true, completion: nil)
    }
    
    @IBAction func logoSwiped(_ recognizer: UISwipeGestureRecognizer) {
        //recognizer.direction = UISwipeGestureRecognizerDirection.up
    }
    
    @IBAction func edgeSwipe(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            self.view.backgroundColor = UIColor(red: rand(), green: rand(), blue: rand(), alpha: rand())
        default:
            break
        }
    }
    
    @IBAction func logoPanned(_ recognizer: UIPanGestureRecognizer) {
       let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation( CGPoint(x: 0, y: 0) , in: self.view)
    }
    
    var transform = CGAffineTransform.identity
    
    var rotation = CGFloat(0)
    @IBAction func logoRotated(_ recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            rotation += recognizer.rotation
            transform.rotated(by: rotation)
            view.transform = transform
        }
        recognizer.rotation = 0.0
        print("R - Rotation: \(rotation)")
        print("R - Scale: \(scale)")
    }
    

    var scale = CGFloat(1)
    @IBAction func logoPinched(_ recognizer: UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            scale *= recognizer.scale
            transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            view.transform = transform
        }
        recognizer.scale = 1
        print("S - Rotation: \(rotation)")
        print("S - Scale: \(scale)")
    }
}
