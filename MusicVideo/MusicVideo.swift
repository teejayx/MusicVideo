//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Olatunji SK on 8/2/16.
//  Copyright © 2016 Olatunji SK. All rights reserved.
//

import Foundation

class Videos {

    //Data Encapsulation 
    private var _vName:String
    private var _vImageUrl: String
    private var _vVideoUrl: String
    
    //Make a getter 
    
    var vName:String{
        return _vName
    
    }
    
    var vImage: String
        {
      return _vImageUrl
    }
    
    var vVideoUrl: String{
    
        return _vVideoUrl
    
    }
    
    
    init(data: JSONDictionary){
    
    //if we dont inititialize all propertise we will get an error message 
    //Return from initializer without initializing all stored propertise 
    
    //Video name 
    if let name = data["im:name"] as? JSONDictionary,
        vName = name["label"] as? String{
            self._vName = vName
        }
        else
    {
      //You may not always get data back from the json you may want to displaay the message 
        //elment is the JSON is expected 
        _vName = ""
    }
        
   //the video image 
        if let img = data["im:image"] as? JSONArray,
        image = img[2]as? JSONDictionary,
            immage = image["label"]as?String {
          _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else
        {
         _vImageUrl = ""
        
        }
        
        //Video
        
        if let video = data["link"] as? JSONArray,
          vUrl = video[1] as? JSONDictionary,
         vHref = vUrl["attributes"] as? JSONDictionary,
        vVideoUrl = vHref["href"] as? String {
        self._vVideoUrl = vVideoUrl
        }
        else {
          _vVideoUrl = ""
        }
        
        
        
    }
    
}