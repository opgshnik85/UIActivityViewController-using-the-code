//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by MacBook on 30.01.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Добавляем наши методы в жизненный цикл viewDidLoad,
        чтобы они создались, когда формируется наш Controller,
        без добавления наших методов, ничего не будет отображаться на экране */
        self.createTextField()
        self.creatButton()
    }
    //MARK: - Метод
        //Создаем TextField
    func createTextField() {
        //Задаем координаты и размеры нашему TextField
        self.textField.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        //Устанавливаем по центру экрана
        self.textField.center = self.view.center
        //Стиль границы для текстового поля
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        //Отображает текст, когда в текстовом поле пусто
        self.textField.placeholder = "Введите текст для отправки"
        //Подписались на Delegate
        self.textField.delegate = self
        //Добавляем наш TextField на View
        self.view.addSubview(self.textField)
    }
        //Создаем Button
    func creatButton() {
        //Задаем инициализатор для Button
        self.buttonShare = UIButton(type: .roundedRect)
        //Задаем координаты и размеры нашему Button
        self.buttonShare.frame = CGRect(x: 50, y: 470, width: 300, height: 50)
        //Добавляем название для Button и состояние
        self.buttonShare.setTitle("Поделиться", for: .normal)
        //Добавляем Таргет
        self.buttonShare.addTarget(self, action: #selector(hendlerShare), for: .touchUpInside)
        //Добавляем наш Button на View
        self.view.addSubview(self.buttonShare)
    }
    
    @objc func hendlerShare(paramSender:Any) {
        let text = textField.text
        if text?.count == 0 {
            let message = "Сначала введите текст"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        self.activityViewController = UIActivityViewController(activityItems:
            [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true, completion: nil)
    }
    //MARC: - UITextFieldDelegate
        /* Убираем клавиатуру по нажатию Ввод/Return.
        Обязательно добавляем UITextFieldDelegate в class ViewController
        и подписываем наш textField на Delegate иначе не будет ничего работать! */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
}
