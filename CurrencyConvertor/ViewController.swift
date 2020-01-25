//
//  ViewController.swift
//  CurrencyConvertor
//
//  Created by Quadir on 1/21/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate  {
    

    @IBOutlet weak var pickerView: UIPickerView!
    var currencyConv: [Curr] = []
    var BuyTT = [String:String]()
    var SellTT = [String:String]()
    var BuyNotes = [String:String]()
    var SellNotes = [String:String]()
    var BuyTC = [String:String]()
    @IBOutlet weak var ausLabel: UILabel!
    @IBOutlet weak var foreignTextField: UITextField!
    var selectedCurrency:String = ""
    var rate = ["BuyTT","SellTT","BuyNotes","SellNotes","BuyTC"]
    
    @IBOutlet weak var foreignCurrency: UILabel!
    @IBOutlet weak var exchangeRate: UILabel!
    var x = 0.0
    var y = 0.0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var row = pickerView.selectedRow(inComponent: 0)
        if component == 0 {
            return currencyConv.count
        }

        else {
            return rate.count
        }
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return currencyConv[row].productID
        if component == 0 {
        return currencyConv[row].productID
        } else {
        return rate[row]
        }
       }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if component == 0 {
        selectedCurrency = currencyConv[row].productID
        foreignCurrency.text = selectedCurrency
        }else{
            if(rate[row] == "BuyTT"){
                x = Double(foreignTextField.text ?? "") ?? 0.0 as! Double
                y = Double(BuyTT[selectedCurrency] ?? "" ) ?? 0.0 as! Double
                
                ausLabel.text = String(round(x/y))
            }else if(rate[row] == "SellTT"){
                 x = Double(foreignTextField.text ?? "") ?? 0.0 as! Double
                 y = Double(SellTT[selectedCurrency] ?? "" ) ?? 0.0 as! Double
                               
                 ausLabel.text = String(round(x/y))
            }else if(rate[row] == "BuyNotes"){
                x = Double(foreignTextField.text ?? "") ?? 0.0 as! Double
                y = Double(BuyNotes[selectedCurrency] ?? "" ) ?? 0.0 as! Double
                                              
                ausLabel.text = String(round(x/y))
            }else if(rate[row] == "SellNotes"){
                 x = Double(foreignTextField.text ?? "") ?? 0.0 as! Double
                 y = Double(SellNotes[selectedCurrency] ?? "" ) ?? 0.0 as! Double
                                              
                 ausLabel.text = String(round(x/y))
            }else if(rate[row] == "BuyTC"){
                 x = Double(foreignTextField.text ?? "") ?? 0.0 as! Double
                 y = Double(BuyTC[selectedCurrency] ?? "" ) ?? 0.0 as! Double
                                              
                 ausLabel.text = String(round(x/y))
            }
            
        }
    }
    
    
    //view model did Set Properties
    var viewModel: CurrencyViewModel! {
           didSet {
               
            
           }
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //setup view model
        setViewModel()
        
        //call viewmodel method
        viewModel.fetchfromURL()
       
        //setup pickerView
        setPickerView()
        
        
        
    }
    

    func setViewModel(){
        
        viewModel = CurrencyViewModel()
        viewModel.vcviewmodeldelegate = self
        
    }
    
    func setPickerView(){
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
    }
    

}

//viewmodel delegate implementation
extension ViewController: VCViewModelDelegate{
    
    func shareCurrencyItems(_ currencyConv: [Curr],BuyTT:[String:String],SellTT:[String:String],BuyNotes:[String:String],SellNotes:[String:String],BuyTC:[String:String] ) {
    
       self.currencyConv = currencyConv
       self.BuyTT = BuyTT
       self.SellTT = SellTT
       self.BuyNotes = BuyNotes
       self.SellNotes = SellNotes
       self.BuyTC = BuyTC
       
    }
    
}
    
    
    


