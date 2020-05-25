//
//  WelcomePageViewController.swift
//  Roamy App
//
//  Created by Christopher A. Kumor on 2/20/20.
//  Copyright © 2020 Christopher A. Kumor. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIViewController {
    
    
    @IBOutlet weak var WPContentView: UIView!
    
    @IBOutlet weak var PopularLocalRoutesView: UIView!
    
    @IBOutlet weak var WelcomeButtonsView: UIView!
    
    @IBOutlet weak var LocPop1View: UIView!
    
    @IBOutlet weak var PopLoc2View: UIView!
    
    
    @IBOutlet weak var CoffeeShopOfTheDayHeight: NSLayoutConstraint!
    
    @IBOutlet weak var CoffeeShopOfTheDayView: UIView!
    
    
    @IBOutlet weak var CoffeeShopOfTheDayImageView: UIImageView!
    
    @IBOutlet weak var CoffeeShopNameLabel: UILabel!
    
    @IBOutlet weak var CoffeeShopDescriptionLabel: UILabel!
    
    @IBOutlet var WelcomePageView: UIView!
    
    @IBOutlet weak var AccountView: UIView!
    
    @IBAction func CoffeeShopMinButtonDown(_ sender: Any) {

    if(CoffeeShopOfTheDayView.frame.height.magnitude.isEqual(to: 320))
        {
            CoffeeShopOfTheDayImageView.isHidden = true
            CoffeeShopNameLabel.isHidden = true
            CoffeeShopDescriptionLabel.isHidden = true
            CoffeeShopOfTheDayHeight.constant = 50
        }
            
        else if(CoffeeShopOfTheDayView.frame.height.magnitude.isEqual(to: 50))
        {
            CoffeeShopOfTheDayHeight.constant = 320
            CoffeeShopOfTheDayImageView.isHidden = false
            CoffeeShopNameLabel.isHidden = false
            CoffeeShopDescriptionLabel.isHidden = false
        }
        }
    
    
    @IBAction func AccountAccessButtonDown(_ sender: Any) {
        AccountView.isHidden = false
    }
    
    
    @IBAction func HideAccountButton(_ sender: Any) {
        AccountView.isHidden = true
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .default
    }
    
    func roundViewTopedges(viewInUse: UIView)
    {
        viewInUse.layer.cornerRadius = 10
        viewInUse.layer.masksToBounds = true
            
        viewInUse.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
    
    func roundViewAlledges(viewInUse: UIView)
      {
          viewInUse.layer.cornerRadius = 10
          viewInUse.layer.masksToBounds = true
              
        viewInUse.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
          
      }
    
    @IBAction func LogOutButtonDown(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "LogInViewController")
        nextVC.modalPresentationStyle = .fullScreen
        show(nextVC, sender: self)
    }
    
    override func viewDidLoad() {
        
        roundViewTopedges(viewInUse: WelcomeButtonsView)
        roundViewTopedges(viewInUse: WPContentView)
        roundViewTopedges(viewInUse: PopularLocalRoutesView)
        roundViewAlledges(viewInUse: LocPop1View)
        roundViewAlledges(viewInUse: PopLoc2View)
        roundViewTopedges(viewInUse: CoffeeShopOfTheDayView)
        WelcomePageView.bringSubviewToFront(AccountView)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
