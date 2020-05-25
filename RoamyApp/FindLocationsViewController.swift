//
//  FindLocationsViewController.swift
//  Roamy App
//
//  Created by Christopher A. Kumor on 3/28/20.
//  Copyright © 2020 Christopher A. Kumor. All rights reserved.
//



import UIKit





class FindLocationsViewController: LocalRouteInfoViewController, UISearchBarDelegate, UITableViewDelegate,UITableViewDataSource{
    
@IBOutlet weak var ResultsTableView: UITableView!
@IBOutlet weak var SearchBar1: UISearchBar!
var filteredData: [String]!
var searchActive = false
var data : [String]  = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive)
        {
            return filteredData.count
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
    }
        
    


    override func viewDidLoad() {
        super.viewDidLoad()
        ResultsTableView.delegate = self
        ResultsTableView.dataSource = self
        SearchBar1.delegate = self
        CreateArray(fileinUse: "/Users/ckumor/Desktop/Roamy App/Roamy App/Detroit_Locations.txt", listInUse: &data)
        

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
