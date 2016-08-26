//
//  ViewController.swift
//  MusicVideo
//
//  Created by Olatunji SK on 7/26/16.
//  Copyright © 2016 Olatunji SK. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
        
        
        
        
        
        
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
        
    
    }



}

