//
//  FoodViewController.swift
//  FoodApp
//
//  Created by Macbook on 25/02/23.
//

import UIKit
import RxSwift
import Kingfisher

class FoodViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var presenter: FoodPresenter?
    let subject = PublishSubject<MoviePopular>()
    
    var dataResult: [ResultMovies] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
   func setup() {
       tableView.registerCellWithNib(FoodCell.self)
       tableView.delegate =  self
       tableView.dataSource =  self
       
       subject.subscribe(onNext: { [weak self] data in
           guard let self = self else { return }
           self.dataResult.append(contentsOf: data.results)
       }).disposed(by: bag)
    }
    
    func loadData() {
        if let presenter = self.presenter {
            presenter.fetchFood()
                .subscribe { (data: MoviePopular) in
                    self.subject.onNext(data)
                    print(data)
            } onError: { error in
                self.subject.onError(error)
            }
            .disposed(by: bag)
        }
    }


}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataResult.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataResult[indexPath.row]
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FoodCell
        cell.titleLable.text = data.title
        cell.ratingLabel.text =  data.originalTitle
        cell.dateLabel.text = data.releaseDate
        cell.foodImage.kf.setImage(with: URL(string: BaseConstant.imageURL + data.backdropPath), placeholder: #imageLiteral(resourceName: "netflix"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
    
