//
//  ViewController.swift
//  Viper Demo
//
//  Created by Chinny Ponnoose on 1/17/19.
//  Copyright © 2019 Chinny Ponnoose. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presentor:ViewToPresenterProtocol?
    
    var noticeArrayList:[NoticeModel] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notice-Module"
        presentor?.startFetchingNotice()
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension NoticeViewController : PresenterToViewProtocol {
    
    func showNotice (noticeArray:Array<NoticeModel>) {
        
        self.noticeArrayList = noticeArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    func showError() {
        
    }
}

extension NoticeViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoticeCell
        cell.id.text =  noticeArrayList[indexPath.row].id
        cell.title.text =  noticeArrayList[indexPath.row].title
        cell.brief.text = noticeArrayList[indexPath.row].brief
         cell.filesource.text = noticeArrayList[indexPath.row].filesource
        return cell

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return noticeArrayList.count
            }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          presentor?.showMovieController(navigationController: navigationController!)
     }
    
}

class NoticeCell :UITableViewCell{
    
    @IBOutlet weak var brief: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var filesource: UILabel!
}
