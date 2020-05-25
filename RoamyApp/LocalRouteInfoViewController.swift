//
//  LocalRouteInfoViewController.swift
//  Roamy App
//
//  Created by Christopher A. Kumor on 3/5/20.
//  Copyright © 2020 Christopher A. Kumor. All rights reserved.
//

import UIKit

class LocalRouteInfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var CountryLabel: UILabel!
        
    @IBOutlet weak var CityLabel: UILabel!
    
    @IBOutlet weak var CountryPickerView: UIPickerView!
       
    @IBOutlet weak var CityPickerViewer: UIPickerView!
       

    
    func numberOfComponents(in pickerView: UIPickerView)  -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var desiredCount = 0
        if(pickerView == CountryPickerView)
        {
            //print("we are using countries!")
            desiredCount = countries.count
            
        }
        else if(pickerView == CityPickerViewer)
        {
            //print("We are using cities")
            desiredCount = cities.count
        }
        //print("Desired count = " + String(desiredCount))
        return desiredCount
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        var pickedDestination = ""
        if(pickerView == CountryPickerView)
        {
           pickedDestination = countries[row]
        }
        else if(pickerView == CityPickerViewer)
        {
            pickedDestination = cities[row]
        }
        return pickedDestination
       }
    
    func pickerView (_ pickerView: UIPickerView, didSelectRow: Int, inComponent: Int)
    {
        if(pickerView == CountryPickerView)
        {
            //print("Country selected!")
            CountryLabel.text = countries[didSelectRow]
        }
        else if (pickerView == CityPickerViewer)
        {
            //print("City Selected!")
            CityLabel.text = cities[didSelectRow]
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
     {
         return .lightContent
     }
    
    
    
    var countries:[String] = []
    var cities:[String] = []
    
    @IBAction func CancelButtonDown(_ sender: Any) {
           let NextVC =  UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "WPViewController")
        NextVC.modalPresentationStyle = .fullScreen
        show(NextVC, sender: self)
    }
    
    @IBAction func YourCountryButton(_ sender: Any) {
   
        if(CountryPickerView.isHidden == true)
        {
            CountryPickerView.isHidden = false
        }
        
        else if(CountryPickerView.isHidden == false)
              {
                  CountryPickerView.isHidden = true
              }
        SelectButton.isHidden = false
    }
    
    
    @IBAction func YourCityButton(_ sender: Any) {
        
               if(CityPickerViewer.isHidden == true)
               {
                   CityPickerViewer.isHidden = false
               }
               
               else if(CityPickerViewer.isHidden == false)
                     {
                         CityPickerViewer.isHidden = true
                     }
        SelectButton.isHidden = false
    }
    
    @IBOutlet weak var SelectButton: UIButton!
    
    @IBAction func SelectButtonDown(_ sender: Any) {
        if( CountryPickerView.isHidden == false  || CityPickerViewer.isHidden == false)
        {
            CountryPickerView.isHidden = true
            CityPickerViewer.isHidden = true
            SelectButton.isHidden = true
            
        }
    }
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
       
        CountryPickerView.delegate = self
        CountryPickerView.dataSource = self
        CityPickerViewer.delegate = self
        CityPickerViewer.dataSource = self
        CreateArray(fileinUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/Countries.txt", listInUse: &countries)
        CreateArray(fileinUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/NationalCapitals.txt", listInUse: &cities)
 
              
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
