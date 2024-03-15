//
//  Motivation.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import Foundation

struct Motivation {
    
    var motivationID:String
    var motivationSentences:String
    
    init(motivationID: String, motivationSentences: String) {
        self.motivationID = motivationID
        self.motivationSentences = motivationSentences
       
    }
}


struct ImageName {
    
    var backgroundImageName:String
    var shareFrameName:String
    var shareSentence:String
    
    init(backgroundImageName: String, shareFrameName: String, shareSentence: String) {
        self.backgroundImageName = backgroundImageName
        self.shareFrameName = shareFrameName
        self.shareSentence = shareSentence
    }
    
}
