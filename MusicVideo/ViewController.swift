//
//  ViewController.swift
//  MusicVideo
//
//  Created by Olatunji SK on 7/26/16.
//  Copyright © 2016 Olatunji SK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
        
        
        
        
        
        
    }
    
    func didLoadData(result:String){
        print(result)
    }



}

