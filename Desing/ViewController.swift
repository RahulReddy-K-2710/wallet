//
//  ViewController.swift
//  Desing
//
//  Created by Roja on 17/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var wallet = [WalletModel]()
    
    var freeApps = [String]()
    var paidApps = [String]()
    
//MARK: Outlets
    @IBOutlet weak var walletNavigation: UINavigationItem!
    @IBOutlet weak var floderBarBtn: UIBarButtonItem!
    @IBOutlet weak var homeBarBtn: UIBarButtonItem!
    @IBOutlet weak var usdButton: UIButton!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var btcLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var downArrowImg: UIImageView!
    @IBOutlet weak var floderImg: UIImageView!
    
    @IBOutlet weak var walletTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // CornorRadius of progressLabel and FloderImg
        cornorRadius()
        configureTableView()
        wallet = WalletModel.getWalletBalance()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setShadowTo(detailsView)
    }
    
    private func configureTableView() {
//        walletTableView.register(UINib(nibName: WalletHeaderTableViewCell.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: WalletHeaderTableViewCell.identifier)
        walletTableView.register(UINib(nibName: WalletHeaderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: WalletHeaderTableViewCell.identifier)
        walletTableView.separatorStyle = .none
    }
    
    private func setShadowTo(_ view: UIView, radius: CGFloat = 10) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = radius
        view.layer.masksToBounds = false
    }
    
    func cornorRadius() {
        progressLabel.layer.cornerRadius = 10
        progressLabel.clipsToBounds = true
        floderImg.layer.cornerRadius = 20
        floderImg.clipsToBounds = true
        detailsView.layer.cornerRadius = 15
        detailsView.clipsToBounds = true
    }
    
    @IBAction func appSegmentDidChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("\n>>>> Free apps selected")
        } else {
            print("\n>>>> Paid apps selected")
        }
    }
 
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wallet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Create cell object
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell
    // Create wallet object
        let wallet = wallet[indexPath.row]
    // Configer data to cell
        if let view = cell?.cellView {
            setShadowTo(view, radius: 5)
        }
        cell?.prepareWallet(wallet)
        
        // return cell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: WalletHeaderTableViewCell.identifier)
        headerView?.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}


