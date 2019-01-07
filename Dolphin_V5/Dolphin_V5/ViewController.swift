//
//  ViewController.swift
//  Dolphin_V5
//
//  Created by an16aal on 14/12/2018.
//  Copyright © 2018 CSStestuser. All rights reserved.
//

import UIKit

protocol subviewDelegate{
    func changeSomething()
}

class ViewController: UIViewController, subviewDelegate {
    
    //let when = DispatchTime.now() + 2
    // DispatchQueue.main.asyncAfter(deadline: when)
    //{
    //Your code for actions when the time is up
    //}
    
    func changeSomething(){
        collisionBehaviour.removeAllBoundaries()
    }

    // screen fit
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    //behaviours and animators
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    var collisionBehaviour: UICollisionBehavior!
    var gravityBehaviour: UIGravityBehavior!
    
    //Image links
    @IBOutlet weak var dolphin: UIImageView!
    @IBOutlet weak var ring: UIImageView!
    @IBOutlet weak var missile: UIImageView!
    @IBOutlet weak var background: UIImageView!
    
    // loops
    let missileArray = [0,2,4,6,8,10,12,14,16,18]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // background
        var backgroundArray: [UIImage]!
        
        
        backgroundArray = [UIImage(named: "Background_1")!,
                           UIImage(named: "Background_2")!,
                           UIImage(named: "Background_3")!,
                           UIImage(named: "Background_4")!,
                           UIImage(named: "Background_5")!,
                           UIImage(named: "Background_6")!,
                           UIImage(named: "Background_7")!,
                           UIImage(named: "Background_8")!,
                           UIImage(named: "Background_9")!,
                           UIImage(named: "Background_10")!,
                           UIImage(named: "Background_9")!,
                           UIImage(named: "Background_8")!,
                           UIImage(named: "Background_7")!,
                           UIImage(named: "Background_6")!,
                           UIImage(named: "Background_5")!,
                           UIImage(named: "Background_4")!,
                           UIImage(named: "Background_3")!,
                           UIImage(named: "Background_2")!,
                           UIImage(named: "Background_1")!]
        
        background.image = UIImage.animatedImage(with: backgroundArray, duration: 2)
        
        
        //dolphin
        var imageArray: [UIImage]!
        
        imageArray = [UIImage(named: "Dolphin_1.gif")!,
                      UIImage(named: "Dolphin_2.gif")!,
                      UIImage(named: "Dolphin_3.gif")!,
                      UIImage(named: "Dolphin_4.gif")!,
                      UIImage(named: "Dolphin_5.gif")!,
                      UIImage(named: "Dolphin_6.gif")!]
        
        dolphin.image = UIImage.animatedImage(with: imageArray, duration: 0.5)
        
        //missile
        for index in 0...9{
            let delay = Double (self.missileArray [index])
            let release = DispatchTime.now() + delay
            DispatchQueue.main.asyncAfter(deadline: release)
        
        let missileImage = UIImageView(image: nil)
        var missileArray: [UIImage]!
        missileArray = [UIImage(named: "Missile_2.gif")!,
                        UIImage(named: "Missile_3.gif")!]
        
        missile.image = UIImage.animatedImage(with: missileArray, duration: 1.5)
                
        missileImage.image = UIImage.animatedImage(with: missileArray, duration: 1.5)
        missileImage.frame = CGRect (x: 800, y: CGFloat(arc4random_uniform(UInt32(300))), width: 80, height: 35)
        
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        self.dynamicItemBehaviour = UIDynamicItemBehavior(items: [missileImage])
        self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: -400, y: 0 ), for: missileImage)
        // self.dynamicAnimator.addBehavior(self.dynamicItemBehaviour)
        }
        //rings
        var ringArray: [UIImage]!
        
        ringArray = [UIImage(named: "Ring_1")!,
                     UIImage(named: "Ring_2")!,
                     UIImage(named: "Ring_3")!,
                     UIImage(named: "Ring_4")!,
                     UIImage(named: "Ring_5")!,
                     UIImage(named: "Ring_6")!]
        
        ring.image = UIImage.animatedImage(with: ringArray, duration: 0.5)
        
        //animations
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.ring.center.x -= self.view.bounds.width
            }
        )
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.missile.center.x -= self.view.bounds.width
            }
        )
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

