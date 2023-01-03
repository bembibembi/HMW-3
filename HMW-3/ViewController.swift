//
//  ViewController.swift
//  HMW-3
//
//  Created by 지구9 on 3/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var namesTableView: UITableView!
    
    var names : [String] = ["Adina" , "Milana" , "Rinat" , "jasmin", "Helen" ]
    
    var numbers : [String] = ["0709400578" , "0556789047" , "0708040908" , "0500050907", "0999090709"]
    
    var addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        namesTableView.dataSource = self
        namesTableView.delegate = self
        namesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "name_cell")
        
        view.addSubview(addButton)
        addButton.layer.cornerRadius = 80 / 2
        addButton.setTitle("+", for: .normal)
        addButton.backgroundColor = .blue
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        addButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    @objc func addButtonTap(){
        names.insert("Aliya", at: 0)
        //names.append("Kemal")
        namesTableView.reloadData()
        print(names)
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "name_cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(names[indexPath.row])
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "VC") as! NextViewController
        secondVC.text = names[indexPath.row] as! String
        secondVC.text2 = numbers[indexPath.row] as! String
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}



    
