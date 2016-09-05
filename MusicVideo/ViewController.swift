//
//  ViewController.swift
//  MusicVideo
//
//  Created by Olatunji SK on 7/26/16.
//  Copyright © 2016 Olatunji SK. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
 
    var videos = [Videos]()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate =  self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.reachabilityStatusChanged), name: "ReachStatusChanged", object: nil)
        
        reachabilityStatusChanged()
        
        
        
        
        
        
        
    }
    
    func didLoadData(videos: [Videos]){
        
        print(reachbilityStatus)
        self.videos = videos
        
        for item in videos{
          print("name = \(item.vName)")
            
        }
        
        
        
        for(index, item) in videos.enumerate(){
            
            print("\(index) name = \(item.vName)")
        }
        tableView.reloadData()
        
    }
    
    func reachabilityStatusChanged()
    {
        
        switch reachbilityStatus {
        case NOACCESS: view.backgroundColor = UIColor.redColor()
        displayLabel.text = "No Internet"
        case WIFI: view.backgroundColor = UIColor.greenColor()
        displayLabel.text = "Reachable with Wifi"
        case WWAN: view.backgroundColor = UIColor.yellowColor()
        displayLabel.text = "Reachable with Cellular"
        default:return
        }
        
        
        
        
    }
    
    
    
   
    
    deinit
    {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
     return videos.count
    
    
    }
    
 
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let video = videos[indexPath.row]
        cell.textLabel?.text = ("\(indexPath.row + 1)")
        cell.detailTextLabel?.text = video.vName
        return cell
        
    }
    



}

