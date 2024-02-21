//
//  SeekerViewController.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/02/24.
//

import Foundation
import UIKit

class SeekerViewController: UIViewController {
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    var presenter: ViewToPresenterSeekerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    /** this function configure the componets in the seerker view */
    func setUpView(){
        presenter?.validateQuery(text: "")
        txtSearch.delegate = self
        txtSearch.returnKeyType = UIReturnKeyType.done
    }
    
    /** excecute method for go to home module and pass query words*/
    @objc func tapSearch(){
        presenter?.goToHome(query: txtSearch.text!, view: self)
    }
    
    /**
        this function cancel searchin action
     */
    @objc func tapCancel( textfield: UITextField){
        presenter?.goToHome(query: txtSearch.text!, view: self)
    }

}
extension SeekerViewController: PresenterToViewSeekerProtocol{
    
    func dissmiss() {
        
    }
    
    func validateQuery(isValid: Bool) {
        if isValid {
            presenter!.goToHome(query: txtSearch.text ?? "", view: self)
        }
       
    }
    
    
}
extension SeekerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter?.validateQuery(text: textField.text ?? "")
       
        return true
    }
}
