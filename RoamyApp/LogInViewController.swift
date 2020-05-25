//
//  LogInViewController.swift
//  Roamy App
//
//  Created by Christopher A. Kumor on 2/18/20.
//  Copyright © 2020 Christopher A. Kumor. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var LogInLabel: UILabel!
    
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LogInFailureTextField: UILabel!
    
    func ChangeRemeberMeStatus(status: String)
    {
        
           do{
               try status.write(toFile: "/Users/ckumor/Desktop/Roamy App/Roamy App/RememberMeState.txt", atomically: true, encoding: String.Encoding.ascii)
           }
           catch{
               print("Remeber Me Status File not found!")
           }
    }
    
    func fillInInfo()
    {
        CheckButton.setImage(UIImage.strokedCheckmark, for: .normal)
        CheckButton.setNeedsDisplay()
        CheckILogInValExists(currentTextField: UsernameTextField, fileInUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/Username.txt", TextFieldStatus: "username")
    }
    
    @IBOutlet weak var CheckButton: UIButton!
    
    func CheckILogInValExists(currentTextField:UITextField, fileInUse: String, TextFieldStatus: String)
    {
        do{
             currentTextField.text = try String(contentsOfFile: fileInUse, encoding: String.Encoding.ascii)
        }
        catch{
            print("No " + TextFieldStatus + " found!")
        }
    }
    
    func ExtractInfo(fileInUse: String, status: String) -> String
    {
        var placeholder: String = " "
           do{
               placeholder = try String(contentsOfFile: fileInUse, encoding: String.Encoding.ascii)
             }
           catch{
                    print(status.uppercased() + " not found!")
                }
        return placeholder
    }
    
    
    @IBAction func CheckButtonDown(_ sender: Any) {
      
        //print(CheckButton.imageView?.image?.description)
        if (ExtractInfo(fileInUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/RememberMeState.txt", status: "Remeber Me State") ==
        "false")
        {
            print("The checkmark was not there!")
            fillInInfo()
            ChangeRemeberMeStatus(status: "true")
        }
                
        else if (ExtractInfo(fileInUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/RememberMeState.txt", status: "Remeber Me State") ==
        "true")
        {
            print("Behold a checkmark!")
            CheckButton.setImage(nil, for: .normal)
            CheckButton.setNeedsDisplay()
            UsernameTextField.text?.removeAll()
            ChangeRemeberMeStatus(status: "false")
            
            
        }
    }
    
    @IBAction func LogInButtonPressedDown() {
         var username: String = " "
         username = ExtractInfo(fileInUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/Username.txt", status: "username")

         
         var password: String = " "
         password = ExtractInfo(fileInUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/Password.txt", status: "password")

        
              
         if(password == PasswordTextField.text && username == UsernameTextField.text){
            LogInFailureTextField.text = "Log In Successful!"
            let nextVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "WPViewController")
           
            nextVC.modalPresentationStyle = .fullScreen
            show(nextVC, sender: self)
            
         }
         else
         {
             LogInFailureTextField.text = "Log In Failed!"
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(ExtractInfo(fileInUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/RememberMeState.txt", status: "Remeber Me State") ==
        "true")
        {
            
            fillInInfo()
        }
        
       

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
