//
//  ViewController.swift
//  MovieTime
//
//  Created by Cambrian on 2023-02-13.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var persistentContainer: NSPersistentContainer!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = titleTextField.text
        
        try! persistentContainer.viewContext.save()
    }


}

