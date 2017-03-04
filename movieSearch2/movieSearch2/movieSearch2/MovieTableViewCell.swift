//
//  MovieTableViewCell.swift
//  movieSearch2
//
//  Created by Angela Montierth on 3/3/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    func updateViews(movie:Movie) {
        
        movieTitleLabel.text = "Movie Title: \(movie.title)"
        ratingLabel.text = "Popularity: \(movie.popularity)"
        summaryLabel.text = "Summary: \(movie.overview)"
        
    }

}
