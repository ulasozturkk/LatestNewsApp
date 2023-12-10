
import Foundation
import UIKit

struct CustomWidgets {
    
    static func createStackView() ->UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    static func createCustomLabel(text:String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }
    
    static func createCustomButton(text: String) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }
    
    static func createDatePicker() -> UIDatePicker {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.maximumDate = Date.now
        
        return picker
    }
    
}
