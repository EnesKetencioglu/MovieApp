//
//  DetailViewController.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    var presenter: ViewToPresenterDetailProtocol?
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var plot: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var releasedDate: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    var movie: Movie?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = movie?.title
        guard let CompleteURL = URL(string: movie!.poster) else {return}
        self.posterView.sd_setImage(with: CompleteURL)
        genre.text = movie?.genre
        plot.text = movie?.plot
        duration.text = movie?.runtime
        releasedDate.text = movie?.released
        writer.text = movie?.writer
        director.text = movie?.director
        imdb.text = movie?.imdbRating
        presenter?.pageLoaded(movieTitle: movie?.title ?? "")
        
        
    }
    
}

extension DetailViewController: PresenterToViewDetailProtocol{
}


