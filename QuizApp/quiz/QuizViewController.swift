//
//  QuizViewController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 16/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionTableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    
    var categoryId = 0
    var score = 0
    
    var questionIndex = 0 {
        didSet{
            selectedQuestion = self.questionsList[questionIndex]
        }
    }
    var questionsList: [Question] = []
    var selectedQuestion: Question? = nil {
        didSet {
            answsers = (selectedQuestion?.incorrect_answers) ?? []
            answsers.append(selectedQuestion?.correct_answer ?? "")
            questionLabel.text = selectedQuestion?.question ?? "--"
            let index = questionIndex + 1
            questionNumber.text = "question n° \(index)/\(MAX_QUESTIONS)"
        }
    }
    
    var answsers: [String] = [] {
        didSet{
            answsers.sort()
            DispatchQueue.main.async{
                self.questionTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionTableView.delegate = self
        self.questionTableView.dataSource = self
        self.questionTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        fetchQuestions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchQuestions(){
        let loadingPopup = createLoadingPopup(title: "Chargement des questions...", message: nil)
        self.present(loadingPopup, animated: false, completion: nil)
        NetworkAdapter().fetchQuestions(categoryId: categoryId, callback: {(data) in
            loadingPopup.dismiss(animated: false, completion: nil)
            if data != nil{
                let responseParsed = QuestionResponse(data: data as! Dictionary<String, AnyObject>)
                self.questionsList = responseParsed.results ?? []
                self.selectedQuestion = self.questionsList[self.questionIndex]
            }else {
                let informationPopup = createErrorPopup(title: "Erreur", message: "Erreur lors de la recuperation des questions",cancelButtonText: "Ok")
                self.present(informationPopup, animated: false, completion: nil)
            }
        })
    }
    
    func nextQuestion(index: Int){
        if(index == answsers.index(of: selectedQuestion?.correct_answer ?? "") ?? 0){
            score = score+1
        }
        
        if(self.questionIndex<(MAX_QUESTIONS-1)){
            self.questionIndex = self.questionIndex + 1
        }else{
            var title = "Dommage"
            var message = "Vous avez perdu, la prochaine fois peut étre, votre score est \(score)/5"
            if(self.score >= (MAX_QUESTIONS-2)){
                title = "Bravo!"
                message = "Vous avez gagné, votre score est \(score)/5"
            }
            let informationPopup = createErrorPopup(title: title, message: message,cancelButtonText: "Ok", cancelButtonHandler: {(action) in
                //Navigate to home screen
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeView") as! HomeScreenViewController
                self.present(nextViewController, animated:true, completion:nil)
            })
            self.present(informationPopup, animated: false, completion: nil)
        }
    }
    
}

extension QuizViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "question_cell") as! QuestionViewCell
        
        let response = answsers[indexPath.row]
        cell.responseNumber.text = "reponse \((indexPath.row + 1))"
        cell.reponseBody.text = response
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextQuestion(index: indexPath.row)
    }
    
}
