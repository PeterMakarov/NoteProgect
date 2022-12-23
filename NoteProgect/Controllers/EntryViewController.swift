//
//  EntryViewController.swift
//  NoteProgect
//
//  Created by Петр Макаров on 23.12.2022.
//

import UIKit

class EntryViewController: UIViewController {
    
    
    private lazy var titleFiled: UITextField = {
        return $0
    }(UITextField())
    
    private lazy var noteField: UITextView = {
        return $0
    }(UITextView())
    
    private lazy var saveButton: UIButton = {
        $0.addTarget(self, action: #selector(saveButtonDidPressed), for: .touchUpInside)
        return $0
    }(UIButton())
     
    
    
    
    
//    private var completion: ((String?, String?) -> Void)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
//        titleFiled.becomeFirstResponder()
    }
    
    
    //    MARK: Layout

    private func configureNoNotesLabel() {
        view.addSubview(titleFiled)
        
        NSLayoutConstraint.activate([
            titleFiled.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleFiled.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleFiled.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
//    private func checkText() {
//        if let text = titleFiled.text, !text.isEmpty, !noteField.text.isEmpty {
//            completion(text, noteField.text)
//        }
//    }
    
    
    @objc
    func saveButtonDidPressed() {
//        checkText()
    }
    
    
    

}
