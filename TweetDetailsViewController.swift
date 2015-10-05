//
//  TweetDetailsViewController.swift
//  Twitter
//
//  Created by Emily M Yang on 10/4/15.
//  Copyright © 2015 Experiences Evolved. All rights reserved.
//

import UIKit

class TweetDetailsViewController: UIViewController {

    @IBOutlet weak var numFavoritesLabel: UILabel!
    @IBOutlet weak var numRetweetsLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var replyButton: UIButton!
    
    var tweet:Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numFavoritesLabel.text = tweet.favoriteCount
        numRetweetsLabel.text = tweet.retweetCount
        timestampLabel.text = tweet.createdAtString
        tweetTextLabel.text = tweet.text
        usernameLabel.text = tweet.user?.screenname
        nameLabel.text = tweet.user?.name
        profilePictureImageView.setImageWithURL(NSURL(string:(tweet.user?.profileImageUrl)!))
        
        if(tweet.favorited == true){
            //disable button
            favoriteButton.enabled = false;
        }
        
        if(tweet.retweeted == true){
            //disable button
            retweetButton.enabled = false;
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onReplyPressed(sender: AnyObject) {
        var newText = "Test Reply" as String
        TwitterClient.sharedInstance.postReply(newText, tweetID: tweet.id!) { (tweet, error) -> () in
            print("successfully replied")
        }
    }
    
    @IBAction func onRetweetPressed(sender: AnyObject) {
        TwitterClient.sharedInstance.postRetweet(tweet.id!) { (tweet, error) -> () in
            print("retweeted successfully")
            self.retweetButton.enabled = false
        }
    }

    @IBAction func onFavoritePressed(sender: AnyObject) {
        TwitterClient.sharedInstance.postFavorite(tweet.id!) { (tweet, error) -> () in
            print("favorited successfully")
            self.favoriteButton.enabled = false
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
