

import UIKit

protocol selectParametersDelegate {
    func selectEveryParams(q:String?,language:String?,toDate: String?,fromDate: String?)
}

class ChooseEverythingParamsVC: UIViewController {
    
    
    
    let queryLabel = CustomWidgets.createCustomLabel(text: "What are you looking for?")
    let queryTextField = CustomWidgets.createCustomTextfield(text: "Search about...")
    let dateLabel = CustomWidgets.createCustomLabel(text: "Choose Timestamp (required)")
    let fromText = CustomWidgets.createCustomLabel(text: "From: ")
    let toText = CustomWidgets.createCustomLabel(text: "To: ")
    let fromPicker = CustomWidgets.createDatePicker()
    let toPicker = CustomWidgets.createDatePicker()
    let getEverythingButton = CustomWidgets.createCustomButton(text: "Get Articles")
    let stackView = CustomWidgets.createStackView()
    
    var chosenLanguage : String?
    var chosenFromDate : String?
    var chosenToDate : String?
    var enteredQuery : String?
    
    var delegate : selectParametersDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        stackView.addArrangedSubviews(views:queryLabel,queryTextField,dateLabel,fromText,fromPicker,toText,toPicker)
        view.addSubViews(stackView,getEverythingButton)
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,centerX:view.centerXAnchor,height:view.safeAreaLayoutGuide.heightAnchor,heightMultiplier: 0.8)
        getEverythingButton.anchor(top: stackView.bottomAnchor,paddingTop: screenHeight * 0.05,centerX: stackView.centerXAnchor)
        queryTextField.anchor(width: view.safeAreaLayoutGuide.widthAnchor,widthMultiplier: 0.8)
        

        fromPicker.addTarget(self, action: #selector(selectFromDate), for: .valueChanged)
        toPicker.addTarget(self, action: #selector(selectToDate), for: .valueChanged)
        getEverythingButton.addTarget(self, action: #selector(getArticles), for: .touchUpInside)
    }
    
    
    @objc func selectFromDate(_ sender : UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        fromText.text = "From: \(formatter.string(from: sender.date))"
        self.chosenFromDate = formatter.string(from: sender.date)
    }
    @objc func selectToDate(_ sender : UIDatePicker){
        
        if self.fromText.text != "From: " {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            toText.text = "To: \(formatter.string(from: sender.date))"
            self.chosenToDate = formatter.string(from: sender.date)
        }else {
            self.presentedViewController?.dismiss(animated: true)
            let alert = UIAlertController(title: "Error", message: "If you want to select To date, you must pick from date first!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            self.present(alert,animated: true)
        }
    }
    
    @objc func getArticles(){
        let everythingVC = ShowEveryArticlesVC()
        self.delegate = everythingVC
        if queryTextField.text?.isEmpty == false {
            enteredQuery = queryTextField.text!
            delegate?.selectEveryParams(q: enteredQuery?.lowercased(), language: chosenLanguage, toDate: chosenToDate, fromDate: chosenFromDate)
            navigationController?.pushViewController(everythingVC, animated: true)
        }else {
            let alert = UIAlertController(title: "Error", message: "textfield can not be empty fool!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            self.present(alert,animated: true)
        }
    }
    

}
