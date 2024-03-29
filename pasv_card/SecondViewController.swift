//
//  SecondViewController.swift
//  pasv_card
//
//  Created by Elijah Malashko on 12/25/23.
//

import Foundation
import UIKit
import MarkdownKit

class SecondViewController: UIViewController {
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var answerLable: UILabel!
    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var nextQuestionLable: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    var caseIndex: Int = 0
    var questionsAndAnswers: [[String: String]] = []
    var currentIndex = 0
    var currentIndexForQuestion = 0
    var nextQuestionIndex = 1

    var pageTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        performPOSTRequest()

        self.title = pageTitle
        numberOfQuestion.text = "1 out of \(questionsAndAnswers.count)"

    }
    @IBAction func nextButton(_ sender: UIButton) {
        currentIndex += 1
        currentIndexForQuestion += 1
        updateLabels()
        updateNumberOfQuestion()
      //  numberOfQuestion.text = "\(currentIndex + 1) out of \(questionsAndAnswers.count)"
        updateNextQuestion()


    }

    @IBAction func backButton(_ sender: Any) {
        currentIndex -= 1
        currentIndexForQuestion -= 1
        updateLabels()
        //numberOfQuestion.text = "\(currentIndex + 1) out of \(questionsAndAnswers.count)"
        updateNumberOfQuestion()
        updateNextQuestion()
    }
    func updateNumberOfQuestion(){
        numberOfQuestion.text = "\(currentIndex + 1) out of \(questionsAndAnswers.count)"
    }



    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            currentIndex += 1
        case .right:
            currentIndex -= 1
        default:
            break
        }
    }
    func updateLabels() {
        if currentIndex < 0 {
            currentIndex = 0
        } else if currentIndex >= questionsAndAnswers.count {
            currentIndex = questionsAndAnswers.count - 1
        }
        if currentIndex < questionsAndAnswers.count {
            let currentQA = questionsAndAnswers[currentIndex]

            let markdownParser = MarkdownParser(font: UIFont.systemFont(ofSize: 13))

            let parser = MarkdownParser(font: UIFont.systemFont(ofSize: 13))
            parser.header.fontIncrease = 5

            markdownParser.bold.color = UIColor.blue
          //  markdownParser.italic.font = UIFont.italicSystemFont(ofSize: 15)
            markdownParser.header.fontIncrease = 4





            let formattedQuestion = parser.parse("#" + (currentQA["question"] ?? ""))
            let formattedAnswer = markdownParser.parse("##"  + (currentQA["answer"] ?? ""))

            questionLable.attributedText = formattedQuestion
            answerTextView.attributedText = formattedAnswer

        }
    }

    func updateNextQuestion() {
            if currentIndexForQuestion < 0 {
                currentIndexForQuestion = 0
            } else if currentIndexForQuestion >= questionsAndAnswers.count {
                currentIndexForQuestion = questionsAndAnswers.count - 1
            }
            nextQuestionIndex = currentIndexForQuestion + 1
            if nextQuestionIndex < questionsAndAnswers.count {
                let nextQA = questionsAndAnswers[nextQuestionIndex]
                nextQuestionLable.text = nextQA["question"]
            } else {
                nextQuestionLable.text = "No more questions"
            }
    }

    func performPOSTRequest() {
        guard let postURL = URL(string: "https://server-prod.pasv.us/flash/card/search") else {
            print("Invalid URL")
            return
        }

        var postRequest = URLRequest(url: postURL)
        postRequest.httpMethod = "POST"
        postRequest.setValue("S_#dYd23*H_Da3!#gjLdsK:dSdOfd", forHTTPHeaderField: "Mobile-App-Token")
        postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let flashGroupIds = [
            0: "5d4b1df62b69530038877608", // +
            1: "5d4b200b2b69530038877637", // +
            2: "628d9899424f42122992a810", // +
            3: "629a3b37fcb806dd5fa4358a", // +
            4: "5d4a635a2b69530038877491", // +
            5: "628fef95cdc8a7e54f4adc1a", //+
            6: "62a7667b2242d48a2ac13649", // +
            7: "5d4b1fc32b6953003887762f", //+
            8: "5d4b1fb92b6953003887762a", //+
            9: "629fff94910b9d778b97a1e5", //+
            10: "629a27edfcb806dd5fa2f66f", //+
            11: "5d4dc95c4f924f00380c2f87", // +
            12: "5d4b54422b69530038877807", //+
            13: "628fefa2cdc8a7e54f4adc36", // +
            14: "62a8a11ced7a683474067abc", // +
            15: "5d4b21202b69530038877664", //+
            16: "5d4dc8a14f924f00380c2f59", //+
            17: "6295042639fb32941a0e8645", //+
            18: "628ff045cdc8a7e54f4ae256", //+
            19: "629fad80910b9d778b9346c0", //+
            20: "5d4dc8794f924f00380c2f55", // +
            21: "629fc1e8910b9d778b946960", //+
            22: "62a8bc8ded7a683474094738", //+
        ]
        let flashGroupId = flashGroupIds[caseIndex] ?? "defaultFlashGroupId"

        let body: [String: Any] = [
            "flashGroupId": flashGroupId,
            "status": "approved"
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body)
            postRequest.httpBody = jsonData

            let postTask = URLSession.shared.dataTask(with: postRequest) { [self] data, response, error in
                if let error = error {
                    print("Error fetching questions and answers: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("No data received")
                    return
                }

                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    // This is inside your data task completion handler
                    if let payload = json?["payload"] as? [[String: Any]] {
                        self.questionsAndAnswers = payload.compactMap { qa in
                            guard let question = qa["question"] as? String,
                                  let answer = qa["answer"] as? String else {
                                return nil
                            }
                            return ["question": question, "answer": answer]
                        }
                        DispatchQueue.main.async {
                            self.updateLabels()
                            self.updateNextQuestion()
                            self.updateNumberOfQuestion()
                        }
                    }

                } catch {
                    print("Error decoding questions and answers JSON: \(error.localizedDescription)")
                }
            }

            postTask.resume()
        } catch {
            print("Error creating JSON data: \(error.localizedDescription)")
        }
    }
}
