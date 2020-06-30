//
//  DetailViewController.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 29/06/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var webView: WKWebView!

    @IBOutlet var textView: UITextView!
    
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        //Clearing all fields
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //Checking if there is a video
        guard video != nil else {
            return
        }
        
        //Create the embed URL
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        //Loading video into the webView
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //Setting the title and the date label
        self.titleLabel.text = video?.title
        
        //Setting the title and the date label
        self.titleLabel.text = video?.title
        
        //formatting the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //Set the description
        textView.text = video!.description
        
    }
}
