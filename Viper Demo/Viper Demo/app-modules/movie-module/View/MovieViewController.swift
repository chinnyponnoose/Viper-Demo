//
//  MovieViewController.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/22/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie-Module"
       movieTableView .delegate = self
       movieTableView.dataSource = self
        moviePresenter?.startFetchingData()

    }
    var movieListArray = [MovieModel]()
    var moviePresenter:viewToPresenterMovieProtocol?
    @IBOutlet weak var movieTableView: UITableView!
    
}

extension MovieViewController:  presenterToViewMovieProtocol {
    
    func onMovieResponseSuccess(movieModelArrayList:Array<MovieModel>) {
       movieListArray = movieModelArrayList

        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
    func onMovieResponseFailed(error:String) {
        
    }
}

extension MovieViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier:"movieCell", for: indexPath) as! MovieCell
        cell.mTitle.text = movieListArray[indexPath.row].title
        //cell.mDescription.text = movieListArray[indexPath.row].brief
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListArray.count
    }
    
    
}

class MovieCell :UITableViewCell {
    
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!
    
}

