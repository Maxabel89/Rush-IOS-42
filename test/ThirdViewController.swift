//
//  ThirdViewController.swift
//  test
//
//  Created by swift on 20/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit
import MapKit

class ThirdViewController: UIViewController {
    
    let tableData = ["Paris","Ecole 42"," Silicon Valley"]
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
            return self.tableData.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        cell.textLabel!.text = tableData[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0)
        {
            let location = CLLocationCoordinate2D(
                latitude: 48.8566140,
                longitude: 2.3522219
            )
            
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            
            //SecondViewController().mapView.setRegion(region, animated: true)
        }
        else if (indexPath.row == 1)
        {
                let location = CLLocationCoordinate2D(
                    latitude: 48.8965812,
                    longitude: 2.3183760
                )
                
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegion(center: location, span: span)
                //SecondViewController().mapView.setRegion(region, animated: true)
        }
        else if (indexPath.row == 2)
        {
            let location = CLLocationCoordinate2D(
                latitude: 37.7749295,
                longitude: -122.4194155
            )
            
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            //SecondViewController().mapView.setRegion(region, animated: true)
        }
        
    }
}
