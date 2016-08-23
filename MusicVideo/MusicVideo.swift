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
    private var _vRights: String
    private var _vPrice: String
    private var _vArtist: String
    private var _vImid: String
    private var _vGenre: String
    private var _vLinkToiTunes: String
    private var _vReleaseDte: String
    
    //this variable gets created from the UI
    var vImageData:NSData?
    
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
    
    var vRights: String{
      return _vRights
    }
    
    var vArtist: String
        {
      return _vArtist
    }
    var vImid: String
        {
       return _vImid
    }
    
    var vGenre: String
        {
      return _vGenre
    }
    var vLinkToiTunes: String{ return _vLinkToiTunes }
    var vReleaseDte :String { return _vReleaseDte}
    
    
    
    
    
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
        
        
        
        //Price 
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String{
            self._vPrice = vPrice
        }else{
        
          _vPrice = ""
        }
        
        
        //Artist 
        
        
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String{
            self._vArtist = vArtist
        
        }else
        {
            _vArtist = ""
        }
        
        //RELeaseDate 
        
        if let releaseDate = data["im:releaseDate"] as? JSONDictionary,
            rdate = releaseDate["attributes"]as? JSONDictionary,
            vReleaseDte = rdate["label"] as? String{
            self._vReleaseDte = vReleaseDte
        
        }else
        { _vReleaseDte = "" }
        
        //genre
        
        if let genre = data["category"] as? JSONDictionary,
            rel2 = genre["attributes"] as? JSONDictionary,
            vGenre = rel2 ["term"] as? String{
          self._vGenre = vGenre
        }else{ _vGenre = ""}
        
        //linkToItunes
        
        if let lnk = data["link"] as? JSONArray,
           link = lnk[0] as? JSONDictionary,
        linkk = link["attributes"] as? JSONDictionary,
          vLinkToiTunes = linkk["href"] as? String{
         self._vLinkToiTunes = vLinkToiTunes
            
        }else{
            _vLinkToiTunes = ""
        }
        
        
        //Rightss
        
        if let right = data["rights"]as? JSONDictionary,
            vRights = right["label"] as? String{
        
          self._vRights = vRights
        }else{
           _vRights = ""
        }
        
        
        //imd 
        
        if let imid = data["id"]as? JSONDictionary,
         vid = imid["attributes"]as? JSONDictionary,
            vImid = vid["im:id"] as? String{
            self._vImid = vImid
        }else{
        
            _vImid = ""
        }
    
        
    
    }
    }

