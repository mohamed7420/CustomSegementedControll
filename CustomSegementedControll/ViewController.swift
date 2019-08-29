//
//  ViewController.swift
//  CustomSegementedControll
//
//  Created by Mohamed on 8/29/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let videos:[String] = ["Video1" , "Video2" , "Video3" , "Video4" , "Video5"]
    
    let picture:[String] = ["Picture1" , "Picture2" , "Picture3" , "Picture4" , "Picture5"]
    
    let live:[String] = ["Live1" , "Live2" , "Live3" , "Live4" , "Live5"]
    
    lazy var masterArray = videos
    
    let segmentControll : UISegmentedControl = {
        
        let controll = UISegmentedControl(items: ["Videos" , "Pictures" , "Live"])
        controll.selectedSegmentIndex = 0
        controll.addTarget(self, action: #selector(handleSegmentContoll), for: .valueChanged)
        return controll
    }()
    
    @objc fileprivate func handleSegmentContoll(){
        
        if segmentControll.selectedSegmentIndex == 0{
            
            masterArray = videos
            
            tableView.reloadData()
            
        }else if segmentControll.selectedSegmentIndex == 1{
            
            masterArray = picture
            
            tableView.reloadData()
        
        }else {
         
            masterArray = live
            
            tableView.reloadData()
        }
    }
    
   
 let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Custom segementControll"
        
        
        
        let marginStackView = UIStackView(arrangedSubviews: [segmentControll])
        marginStackView.layoutMargins = .init(top:12 ,  left: 12 , bottom: 12 , right: 12)
        marginStackView.isLayoutMarginsRelativeArrangement = true
      
        let stackView = UIStackView(arrangedSubviews: [marginStackView , tableView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        
        
        view.addSubview(stackView)
        configureTableView()
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor) ,
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor) ,
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

            ])
        
        
    }
   

    

}
extension ViewController : UITableViewDelegate , UITableViewDataSource {
  
    
    
    func configureTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return masterArray.count
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
      
        cell.textLabel?.text = masterArray[indexPath.row]
                
    
        return cell
    }
    
}

