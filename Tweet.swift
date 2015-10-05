//
//  Tweet.swift
//  Twitter
//
//  Created by Emily M Yang on 10/3/15.
//  Copyright © 2015 Experiences Evolved. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var favoriteCount: String?
    var retweetCount: String?
    var id:NSNumber?
    var favorited:Bool?
    var retweeted:Bool?

    
    init(dictionary: NSDictionary){
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        favoriteCount = (dictionary["favorite_count"] as? NSNumber)?.stringValue
        retweetCount = (dictionary["retweet_count"] as? NSNumber)?.stringValue
        id = dictionary["id"] as? NSNumber
        favorited = dictionary["favorited"] as? Bool
        retweeted = dictionary["retweeted"] as? Bool
        
        var format = NSDateFormatter()
        format.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = format.dateFromString(createdAtString!)
        
    }
    
    class func tweetsWithArray(array:[NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        for dictionary in array{
            tweets.append(Tweet(dictionary:dictionary))
        }
        return tweets
    }

}
