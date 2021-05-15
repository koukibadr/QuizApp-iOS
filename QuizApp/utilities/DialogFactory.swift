//
//  DialogFactory.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 15/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import Foundation
import UIKit

func createLoadingPopup(title: String?, message: String?) -> UIAlertController{
    
    let loading = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let loadingSpinner = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50.0, height: 50.0))
    
    loadingSpinner.hidesWhenStopped = true
    loadingSpinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    loadingSpinner.startAnimating();
    
    loading.view.addSubview(loadingSpinner)
    return loading
}

func createErrorPopup(
    title: String?,
    message: String?,
    cancelButtonText: String? = nil,
    cancelButtonHandler: ((UIAlertAction) -> Void)? = nil
    ) -> UIAlertController {
    
    let popup = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancelText = cancelButtonText ?? "Annuler"
    popup.addAction(UIAlertAction(title: cancelText, style: .cancel, handler: cancelButtonHandler))
    
    return popup
}

func createInformationPopup(
    title: String?,
    message: String?,
    confirmButtonText: String? = nil,
    cancelButtonText: String? = nil,
    confirmButtonHandler: ((UIAlertAction) -> Void)? = nil,
    cancelButtonHandler: ((UIAlertAction) -> Void)? = nil
    ) -> UIAlertController {
    
    let popup = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    
    let confirmText = confirmButtonText ?? "Confirmer"
    let cancelText = cancelButtonText ?? "Annuler"
    
    popup.addAction(UIAlertAction(title: confirmText, style: .default, handler: confirmButtonHandler))
    
    popup.addAction(UIAlertAction(title: cancelText, style: .cancel, handler: cancelButtonHandler))
    
    return popup
}
