//
//  ViewController.swift
//  KipFeet
//
//  Created by Kuba Tłuczek on 01.03.2018.
//  Copyright © 2018 Kuba Tłuczek. All rights reserved.
//

import UIKit

class Product{
    var prodName:String
    var prodCal:Int
    var prodProt:Int
    var prodFat:Int
    var prodCarbs:Int
    init(_prodName:String, _prodCal:Int, _prodProt:Int, _prodFat:Int, _prodCarbs:Int){
        prodName=_prodName
        prodCal=_prodCal
        prodProt=_prodProt
        prodFat=_prodFat
        prodCarbs=_prodCarbs
    }
}

class ViewController: UIViewController {

    
    let lim_dailyCal:Int=2000
    var dailyCal:Int=0
    let lim_dailyProt:Int=100
    var dailyProt:Int=0
    let lim_dailyFat:Int=66
    var dailyFat:Int=0
    let lim_dailyCarbs:Int=246
    var dailyCarbs:Int=0
    
    var prodTab:[Product]=[]
    
    @IBOutlet weak var txtProdName: UITextField!
    @IBOutlet weak var txtProdQuan: UITextField!
    @IBOutlet weak var txtProdCal: UITextField!
    @IBOutlet weak var txtProdProt: UITextField!
    @IBOutlet weak var txtProdFat: UITextField!
    @IBOutlet weak var txtProdCarbs: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clrTextFields()
        updDaily()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSubmit(_ sender: UIButton) {
        let temp=Product(_prodName:txtProdName.text!, _prodCal:Int(txtProdCal.text!)!, _prodProt:Int(txtProdProt.text!)!, _prodFat:Int(txtProdFat.text!)!, _prodCarbs:Int(txtProdCarbs.text!)!)
        dailyCal=dailyCal+temp.prodCal
        dailyProt=dailyProt+temp.prodProt
        dailyFat=dailyFat+temp.prodFat
        dailyCarbs=dailyCarbs+temp.prodCarbs
        prodTab.append(temp)
        updDaily()
        clrTextFields()
    }
    
    func clrTextFields(){
        txtProdName.text=""
        txtProdQuan.text="0"
        txtProdCal.text="0"
        txtProdFat.text="0"
        txtProdProt.text="0"
        txtProdCarbs.text="0"
    }
    
    @IBOutlet weak var lblDailyCal: UILabel!
    @IBOutlet weak var lblCalPercent: UILabel!
    @IBOutlet weak var lblDailyProt: UILabel!
    @IBOutlet weak var lblProtPercent: UILabel!
    @IBOutlet weak var lblDailyFat: UILabel!
    @IBOutlet weak var lblFatPercent: UILabel!
    @IBOutlet weak var lblDailyCarbs: UILabel!
    @IBOutlet weak var lblCarbsPercent: UILabel!
    
    func updDaily(){
        lblDailyCal.text="\(dailyCal)/\(lim_dailyCal) kcal"
        lblCalPercent.text="\(Int((Double(dailyCal)/Double(lim_dailyCal))*100))%"
        lblDailyProt.text="\(dailyProt)/\(lim_dailyProt) g"
        lblProtPercent.text="\(Int((Double(dailyProt)/Double(lim_dailyProt))*100))%"
        lblDailyFat.text="\(dailyFat)/\(lim_dailyFat) g"
        lblFatPercent.text="\(Int((Double(dailyFat)/Double(lim_dailyFat))*100))%"
        lblDailyCarbs.text="\(dailyCarbs)/\(lim_dailyCarbs) g"
        lblCarbsPercent.text="\(Int((Double(dailyCarbs)/Double(lim_dailyCarbs))*100))%"
        
    }
    
}

