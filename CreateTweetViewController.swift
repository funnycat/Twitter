//
//  CreateTweetViewController.swift
//  Twitter
//
//  Created by Emily M Yang on 10/4/15.
//  Copyright © 2015 Experiences Evolved. All rights reserved.
//

import UIKit

class CreateTweetViewController: UIViewController {

    @IBOutlet weak var tweetTextField: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = User.currentUser?.screenname
        nameLabel.text = User.currentUser?.name
        profilePictureImageView.setImageWithURL(NSURL(string:(User.currentUser?.profileImageUrl)!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
    }

    @IBAction func tweetButtonPressed(sender: AnyObject) {
        let text = tweetTextField.text as String?
        if(text != nil){
                TwitterClient.sharedInstance.postNewTweet(text!, completion: { (tweet, error) -> () in
                    if tweet != nil{
                        print("Successfully posted tweet")
                    }
                })  
        }
        performSegueWithIdentifier("backToTweetsSegue", sender: sender)

        
        
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
