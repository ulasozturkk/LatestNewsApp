import UIKit

protocol chooseParameterProtocol {
    func sendParameters(country: String,category:String?,fromdate:String?,todate: String?)
}


class ChooseParamsVC: UIViewController {
    
    var delegate : chooseParameterProtocol?
    var chosenCountry : String?
    var chosenFromDate : String?
    var chosenToDate : String?
    var chosenCategory : String?
    
    let button = CustomWidgets.createCustomButton(text: "Choose")
    let countryLabel = CustomWidgets.createCustomLabel(text: "Choose Country (required)")
    let categoryLabel = CustomWidgets.createCustomLabel(text: "Choose Category (optional)")
    let categoryButton = CustomWidgets.createCustomButton(text: "Choose")
    let dateLabel = CustomWidgets.createCustomLabel(text: "Choose TimeStamp (optional)")
    let fromLabel = CustomWidgets.createCustomLabel(text: "From: ")
    let toLabel = CustomWidgets.createCustomLabel(text: "To: ")
    let fromDatePicker = CustomWidgets.createDatePicker()
    let toDatePicker = CustomWidgets.createDatePicker()
    let stackView = CustomWidgets.createStackView()
    
    let getTopHeadlinesButton = CustomWidgets.createCustomButton(text: "Get Top Headlines!")
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    func setupUI(){
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(categorySelect), for: .touchUpInside)
        fromDatePicker.addTarget(self, action: #selector(fromDateSelect), for: .valueChanged)
        toDatePicker.addTarget(self, action: #selector(toDateSelect), for: .valueChanged)
        getTopHeadlinesButton.addTarget(self, action: #selector(getArticles), for: .touchUpInside)
        stackView.addArrangedSubviews(views:countryLabel,button,categoryLabel,categoryButton,dateLabel,fromLabel,fromDatePicker,toLabel,toDatePicker)
        view.addSubViews(stackView,getTopHeadlinesButton)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leadingAnchor,centerX:view.centerXAnchor,height:view.safeAreaLayoutGuide.heightAnchor,heightMultiplier: 0.6)
        getTopHeadlinesButton.anchor(top: stackView.bottomAnchor,paddingTop: screenHeight * 0.1,centerX: view.centerXAnchor)
    }
    
    @objc func buttonClicked(){
        let chooseCountry = UIAlertController(title: "Choose Country", message: nil, preferredStyle: .actionSheet)
        
        for option in Countries.CountryCodes.keys {
            let action = UIAlertAction(title: option,style: .default) { chosenAction in
                self.countryLabel.text = "Chosen Country: \(chosenAction.title!)"
                self.chosenCountry = Countries.CountryCodes[option]!
            }
            chooseCountry.addAction(action)
        }
        
        present(chooseCountry,animated: true)
    }
    @objc func categorySelect(){
        let chooseCategory = UIAlertController(title: "Select Category", message: nil, preferredStyle: .actionSheet)
        for option in CategoriesTop.TopCategories {
            let action = UIAlertAction(title: option, style: .default) { chosenoption in
                self.categoryLabel.text = "Chosen Category:  \(option)"
                self.chosenCategory = option
            }
            chooseCategory.addAction(action)
        }
        present(chooseCategory,animated: true)
    }
    @objc func fromDateSelect(_ sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        fromLabel.text = "from : \(dateFormatter.string(from: sender.date))"
        self.chosenFromDate = dateFormatter.string(from: sender.date)
    }
    @objc func toDateSelect(_ sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if fromLabel.text != "From: " {
            toLabel.text = "To : \(dateFormatter.string(from: sender.date))"
            self.chosenToDate = dateFormatter.string(from: sender.date)
        }else {
            presentedViewController?.dismiss(animated: true)
            let alert = UIAlertController(title: "Error", message: "If you want to select To date, you must pick from date first!", preferredStyle: .alert)
            let okbutton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okbutton)
            present(alert,animated: true)
        }
    }
    
    @objc func getArticles(){
        
        guard let chosenCountry = chosenCountry else {
            let alert = UIAlertController(title: "Error", message: "Country must not be empty!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            self.present(alert,animated: true)
            return
        }
        let showTopArticlesVC = ShowTopArticlesVC()
        delegate.self = showTopArticlesVC
        delegate?.sendParameters(country: chosenCountry, category: chosenCategory, fromdate: chosenFromDate, todate: chosenToDate)
        navigationController?.pushViewController(showTopArticlesVC, animated: true)
        
    }
}
