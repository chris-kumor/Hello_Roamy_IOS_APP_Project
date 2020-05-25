//
//  SignUpViewController.swift
//  Roamy App
//
//  Created by Christopher A. Kumor on 2/17/20.
//  Copyright © 2020 Christopher A. Kumor. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBAction func SignUpButtonPressDown() {
        
        var TempAccountInfo: String = ""
        var AccountInfo: String = ""
        TempAccountInfo.append(NameTextField.text ?? " ")
        AccountInfo.append(NameTextField.text ?? " ")
        AccountInfo.append(" ")
          let Name = TempAccountInfo
        if(!(NameTextField.text!.isEmpty))
        {
             do {
                 try Name.write(toFile: "/Users/ckumor/Desktop/Roamy App/Roamy App/AccountInfo.txt", atomically: true, encoding: String.Encoding.ascii)
                   }
                   catch {
                       print("Did not load to AccountInfo file!")
                   }
        }
        NameTextField.text = ""
        TempAccountInfo.removeAll()
        TempAccountInfo.append(UsernameTextField.text ?? " ")
        AccountInfo.append(UsernameTextField.text ?? " ")
        AccountInfo.append(" ")
         let username = TempAccountInfo
        if(!(UsernameTextField.text!.isEmpty))
        {
            do {
                try username.write(toFile: "/Users/ckumor/Desktop/Roamy App/Roamy App/Username.txt", atomically: true, encoding: String.Encoding.ascii)
                  }
                  catch {
                      print("Did not load to UserName file!")
                  }
        }
        UsernameTextField.text = ""
        TempAccountInfo.removeAll()
        TempAccountInfo.append(PasswordTextField.text ?? " ")
        AccountInfo.append(PasswordTextField.text ?? " ")
        AccountInfo.append(" ")
        let password = TempAccountInfo
        if(!(PasswordTextField.text!.isEmpty))
        {
            do {
                try password.write(toFile: "/Users/ckumor/Desktop/Roamy App/Roamy App/Password.txt", atomically: true, encoding: String.Encoding.ascii)
                  }
                  catch {
                      print("Did not load to Password file!")
                  }
        }
        PasswordTextField.text = ""
        TempAccountInfo.removeAll()
        TempAccountInfo.append(EmailTextField.text ?? " ")
        AccountInfo.append(EmailTextField.text ?? " ")
        EmailTextField.text = ""
        if(!(EmailTextField.text!.isEmpty))
        {
        
            do {
                try AccountInfo.write(toFile: "/Users/ckumor/Desktop/Roamy App/Roamy App/AccountInfo.txt", atomically: true, encoding: String.Encoding.ascii)
            }
            catch {
                print("Did not load to file!")
            }
            print (AccountInfo)
            }
        
        let nextVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "AccessAppViewController")
         nextVC.modalPresentationStyle = .fullScreen
         show(nextVC, sender: self)
    }

    override func viewDidLoad() {
        
        
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
