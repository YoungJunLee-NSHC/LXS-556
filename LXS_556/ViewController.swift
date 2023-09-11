//
//  ViewController.swift
//  LXS_556
//
//  Created by YoungJun Lee on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let result : UInt = UInt(LxsGetStatus())
        var sRiskResult : String = ""

        if ((result & 0x100) != 0) {
            // 보안정책 위반 상황이 아니라 보안탐지 로직 내 오류가 발생한 상황입니다.
            // 개발 가이드 '6.5 오류코드'의 항목을 참조하여 그에 맞는 문구로 개별 표현해 주시기 바랍니다.
        }
        else if ((result & 0x400) != 0) {
            // 보안탐지 로직이 순차적으로 수행되지 않은 상황입니다.
            // 개발 가이드 '6.5 오류코드'의 항목을 참조하여 그에 맞는 문구로 개별 표현해 주시기 바랍니다.
        }
        else {

            if (((result & 0xA000) != 0) || ((result & 0xA00000) != 0)) {
                sRiskResult.append("탈옥이 탐지되었습니다.\n")
            }
            if ((result & 0xA0000) != 0) {
                sRiskResult.append("바이너리 위변조가 탐지되었습니다.\n")
            }
            if ((result & 0x10000) != 0) {
                sRiskResult.append("메모리 위변조가 탐지되었습니다.\n")
            }
            if ((result & 0x40000) != 0) {
                sRiskResult.append("리소스 위변조가 탐지되었습니다.\n")
            }
            if ((result & 0xA000000) != 0) {
                sRiskResult.append("디버거가 탐지되었습니다.\n")
            }
        }
            
        // result 가 "0" 인 경우 보안 위협이 발생하지 않았다는 의미입니다.
        if(result != 0) {
            // 팝업 이후에 앱 종료 로직을 추가하지 않으면, 60초 이후에 서비스 앱은 자동 종료됩니다.
            sRiskResult = sRiskResult.appendingFormat("[%X]", result)
                
            let riskAlert = UIAlertController(title: "보안 위협 탐지", message: sRiskResult, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "종료", style: UIAlertAction.Style.default, handler: {okAction in riskAlert.dismiss(animated: true, completion: nil)
                exit(0)
            })
                
            riskAlert.addAction(okAction)
            self.present(riskAlert, animated: true, completion: nil)
        }

    }

}

