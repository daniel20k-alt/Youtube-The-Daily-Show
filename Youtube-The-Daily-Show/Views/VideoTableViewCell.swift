//
//  VideoTableViewCell.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 18/06/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        //Ensure there is a video, since the video was force unwrapped below
        guard self.video != nil else {
            return
        }
        
        //checking whether the image is stored in the app's cache
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //setting the thumbnail imageview for the video
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Setting the title and the date label
        self.titleLabel.text = video?.title
        
        //formatting the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //setting the thumbnail - verifying if not nil
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //downloading the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // get the shared URL Session object
        let session = URLSession.shared
        
        //create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
        
            if error == nil && data != nil {
                
                //Saving the downloaded data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                
                
                
                //check if the cells were recycled properly and display the correct image
                if url!.absoluteString != self.video?.thumbnail {
                    return //the cell was recycled properly
                }
                
                //creating the image object
                let image = UIImage(data: data!)
                
                //creating the imageView
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        // starting the data task
        dataTask.resume()
    }
}
