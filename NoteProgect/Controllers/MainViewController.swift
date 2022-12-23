//
//  ViewController.swift
//  NoteProgect
//
//  Created by Петр Макаров on 23.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableViewCellHeight: CGFloat = 35.0
    var noteData: [(title: String, note: String)] = []
    var selectedRow: Int = -1
    var newRowLabel: String = ""
    
    var newNotesButtonHeight: CGFloat = 40.0
    var newNotesButtonWidth: CGFloat = 40.0
    
    
     var navController: UINavigationController?
    
    
//    private lazy var navController: UINavigationController = {
//        $0.title = "Notes"
//        return $0
//    }(UINavigationController())
    
    private lazy var noNotesLabel: UILabel = {
        $0.text = "Сейчас заметок нет"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    private lazy var newNotes: UIButton = {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.addTarget(self, action: #selector(newNotesDidPresed(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    private lazy var searchBar: UISearchBar = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UISearchBar())

    
    private lazy var tableView: UITableView = {
        $0.delegate = self
        $0.dataSource = self
//        $0.backgroundColor = Asset.Colors.textWhite.color
//        $0.isScrollEnabled = false
//        $0.backgroundColor = .yellow
//        $0.layer.cornerRadius = buttonCornerRadius
//        $0.alpha = 0.7
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return $0
    }(UITableView())
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        noNotes()
//        configureNavigation()
        configureNewNotesButton()
        configureSearchBar()
        configureTableView()
        
    }
    
    //    MARK: Private methods
    
    private func noNotes() {
        if noteData.count == 0 {
            tableView.isHidden = true
            configureNoNotesLabel()
        }
    }
    
    
    //    MARK: Layout
    
//    func configureNavigation() {
//        view.addSubview(navController)
//
//        NSLayoutConstraint.activate([
//            navController.topAnchor.constraint(equalTo: view.topAnchor),
//            navController.leftAnchor.constraint(equalTo: view.leftAnchor),
//            navController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            navController.bottomAnchor.constraint(equalTo: tableView.topAnchor)
//        ])
//    }
    
    func configureNoNotesLabel() {
        view.addSubview(noNotesLabel)
        
        NSLayoutConstraint.activate([
            noNotesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noNotesLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func configureNewNotesButton() {
        view.addSubview(newNotes)
        
        NSLayoutConstraint.activate([
            newNotes.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newNotes.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newNotes.widthAnchor.constraint(equalToConstant: newNotesButtonWidth),
            newNotes.heightAnchor.constraint(equalToConstant: newNotesButtonHeight),
        ])
    }
    
    func configureSearchBar() {
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: newNotes.safeAreaLayoutGuide.bottomAnchor),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor)
        ])
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

//    MARK: Actions
    
    @objc
    func newNotesDidPresed(_: UIButton) {
      
        
//        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
//        if let VC = storyBoard.instantiateViewController(withIdentifier: "EntryViewController") as? EntryViewController,
//            let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
//
//            navController.pushViewController(VC, animated: true)
//        }
        
        
            let vc = EntryViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

//MARK: Extensions

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let row = indexPath.row
//        cell.textLabel?.text = "wfwefwwfw"
//        cell.textLabel?.textAlignment = .center
//        cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
//        cell.textLabel?.snp.makeConstraints { make in
//            make.centerX.equalTo(cell.snp.centerX)
//            make.centerY.equalTo(cell.snp.centerY)
//        }
        cell.textLabel?.text = noteData[indexPath.row].title
        cell.detailTextLabel?.text = noteData[indexPath.row].note
        return cell
//        return UITableViewCell()
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return noteData.count
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return tableViewCellHeight
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //        TODO: переход на контроллеры заметок
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else {
                return
    }
//    vc.title = "Note"
//        navigationController?.pushViewController(vc, animated: true)
        
        
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        if tableData.indices.contains(indexPath.row) {
//            selectedBranch = tableData[indexPath.row]
//            print("You selected cell #\(indexPath.row) \(tableData[indexPath.row].name)!")
//            nextButton.isEnabled = true
//            nextButton.alpha = 1
//        } else {
//            nextButton.isEnabled = false
//            nextButton.alpha = 0.5
//        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
