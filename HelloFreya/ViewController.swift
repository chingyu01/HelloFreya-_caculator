//
//  ViewController.swift
//  HelloFreya
//
//  Created by 胡靜諭 on 2018/1/11.
//  Copyright © 2018年 胡靜諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    已收金額
    
    var recievedAmount: Int? {
        
        didSet {
            
            totalCount.text = "你應該找\(recievedAmount!-total)元"
        }
    }
    //    準備一個變數紀錄目前的總金額
    var total = 0 {
        //        property observer
        didSet {
            totalCount.text = "\(total)"
        }
    }
    
    
    @IBOutlet weak var totalCount: UILabel!
    @IBAction func milkTeaButtonPress(_ sender: Any) {
        total += 30
        // totalCount.text = "\(total)"
    }
    
    @IBAction func blackTeaButtonPress(_ sender: UIButton) {
        //          將label的文字設定為20
        //        totalCount.text = "20"
        
        total += 20
        //        請totalLabel顯示當前金額

        // totalCount.text = "\(total03)"
        
        // totalCount.text = "\(total)"
    }
    
    @IBAction func greenTeaButtonPress(_ sender: Any) {
        
        total += 15
    }
    
    @IBAction func oolongTeaButtonPress(_ sender: Any) {
        
        total += 30
    }
    
    
    @IBAction func pearlMilkButtonPress(_ sender: Any) {
        
        total += 45
    }
    
    @IBAction func kingTeaButtonPress(_ sender: Any) {
        
        total += 50
    }
    
    
    @IBAction func fruitTeaButtonPress(_ sender: Any) {
        
        total += 40
    }
    
    
    @IBAction func flowerTeaButtonPress(_ sender: Any) {
        
        total += 50
    }
    
    
    @IBAction func TiKongYinTeaButtonPress(_ sender: Any) {
        
        total += 55
    }
    
    
    //    回到某一頁用程式顯示如下
    @IBAction func goBackToOrder (segue: UIStoryboardSegue){
        
//       拿到使用者給了多少錢
        
        if let vc = segue.source as? CheckOutViewController{
            recievedAmount = Int(vc.showResultButton.text!)
        }
    }
    
    
    
    @IBAction func checkoutButtonPress(_ sender: Any) {
        
//        準備check out controller 控制器
        if let checkVC = storyboard?.instantiateViewController(withIdentifier: "CheckOutViewController") as? CheckOutViewController{
//            把應收金額傳給第二頁顯示
            checkVC.totalMoney = "\(total)"
            show (checkVC, sender: nil)
            //checkVC.totalAmountLabel.text = "\(total)"
        }
//        顯示新的
        
        
    }
    
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
//  當今天畫面已經載入記憶體的話 很多程式碼會寫在viewDidLoad 但使用者看不到畫面  只執行一次的話 viewDidLoad
        
//        設定導覽列右邊上方的按鈕
        
        navigationItem.title = "請點餐"
//        navigationItem.titleTextAttributes = [UIColor.orangeColor()]
        
//        準備按鈕
        let editMenu = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit,target:self,
            action:#selector(performEditing))
        
        //        將按鈕放入導覽列
        navigationItem.rightBarButtonItem = editMenu
        navigationItem.leftBarButtonItem = editMenu
//        可用陣列顯示
        
    
    
    }
    
    @objc func performEditing(){
        
        print ("有喔 之後就可以編輯了")
    }
    
    
    
//    u要傳值過來 如果是segue 就要用 prepare
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
       if let checkVC = segue.destination as? CheckOutViewController {
            checkVC.totalMoney = "\(total)"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    }




