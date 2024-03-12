//
//  ViewController.swift
//  pasv_card
//
//  Created by Elijah Malashko on 11/23/23.
//

import UIKit
import SDWebImage



class ViewController: UIViewController {

    @IBOutlet weak var lableForFirstImage: UILabel!
    @IBOutlet weak var lableForSecondImage: UILabel!
    @IBOutlet weak var lableForThirdImage: UILabel!
    @IBOutlet weak var lableForFourthImage: UILabel!
    @IBOutlet weak var lableForFiveImage: UILabel!
    @IBOutlet weak var lableForSixImage: UILabel!
    @IBOutlet weak var lableForSevenImage: UILabel!
    @IBOutlet weak var lableForEightImage: UILabel!
    @IBOutlet weak var lableForNineImage: UILabel!
    @IBOutlet weak var lableForTenImage: UILabel!
    @IBOutlet weak var lableForElevenImage: UILabel!
    @IBOutlet weak var lableForTwelveImage: UILabel!
    @IBOutlet weak var lableForThirteenImage: UILabel!
    @IBOutlet weak var lableForFourteenImage: UILabel!
    @IBOutlet weak var lableForFifteenImage: UILabel!
    @IBOutlet weak var lableForSixteenImage: UILabel!
    @IBOutlet weak var lableForSeventeenImage: UILabel!
    @IBOutlet weak var lableForEighteenImage: UILabel!
    @IBOutlet weak var lableForNineteenImage: UILabel!
    @IBOutlet weak var lableForTwentyImage: UILabel!
    @IBOutlet weak var lableForTwentyOneImage: UILabel!
    @IBOutlet weak var lableForTwentyTwoImage: UILabel!
    @IBOutlet weak var lableForTwentyThirdImage: UILabel!



    @IBOutlet weak var imageViewFirst: UIImageView!
    @IBOutlet weak var imageViewSecond: UIImageView!
    @IBOutlet weak var imageViewThird: UIImageView!
    @IBOutlet weak var imageViewFourth: UIImageView!
    @IBOutlet weak var imageViewFive: UIImageView!
    @IBOutlet weak var imageViewSix: UIImageView!
    @IBOutlet weak var imageViewSeven: UIImageView!
    @IBOutlet weak var imageViewEight: UIImageView!
    @IBOutlet weak var imageViewNine: UIImageView!
    @IBOutlet weak var imageViewTen: UIImageView!
    @IBOutlet weak var imageViewEleven: UIImageView!
    @IBOutlet weak var imageViewTwelve: UIImageView!
    @IBOutlet weak var imageViewThirteen: UIImageView!
    @IBOutlet weak var imageViewFourteen: UIImageView!
    @IBOutlet weak var imageViewFifteen: UIImageView!
    @IBOutlet weak var imageViewSixteen: UIImageView!
    @IBOutlet weak var imageViewSeventeen: UIImageView!
    @IBOutlet weak var imageViewEighteen: UIImageView!
    @IBOutlet weak var imageViewNineteen: UIImageView!
    @IBOutlet weak var imageViewTwenty: UIImageView!
    @IBOutlet weak var imageViewTwentyOne: UIImageView!
    @IBOutlet weak var imageViewTwentyTwo: UIImageView!
    @IBOutlet weak var imageViewTwentyThird: UIImageView!

    @IBOutlet weak var firstButton: UIButton!
    var pageTitle: String?






    override func viewDidLoad() {
        super.viewDidLoad()
        performGETRequest()
        self.firstButton.imageView?.contentMode = .scaleAspectFit
    }

    @IBAction func firstButton(_ sender: Any) {
        pageTitle = lableForFirstImage.text
        navigateToSecondViewController(withCase: 0)
    }

    @IBAction func secondButton(_ sender: Any) {
        pageTitle = lableForSecondImage.text
        navigateToSecondViewController(withCase: 1)

    }
    @IBAction func thirdButton(_ sender: Any) {
        pageTitle = lableForThirdImage.text
        navigateToSecondViewController(withCase: 2)
    }

    @IBAction func fourButton(_ sender: Any) {
        pageTitle = lableForFourthImage.text
        navigateToSecondViewController(withCase: 3)


    }
    @IBAction func fiveButton(_ sender: Any) {
        pageTitle = lableForFiveImage.text
        navigateToSecondViewController(withCase: 4)
    }
    @IBAction func sixButton(_ sender: Any) {
        pageTitle = lableForSixImage.text
        navigateToSecondViewController(withCase: 5)
    }

    @IBAction func sevenButton(_ sender: Any) {
        pageTitle = lableForSevenImage.text
        navigateToSecondViewController(withCase: 6)
    }

    @IBAction func eightButton(_ sender: Any) {
        pageTitle = lableForEightImage.text
        navigateToSecondViewController(withCase: 7)
    }
    @IBAction func nineButton(_ sender: Any) {
        pageTitle = lableForNineImage.text
        navigateToSecondViewController(withCase: 8)
    }
    @IBAction func tenButton(_ sender: Any) {
        pageTitle = lableForTenImage.text
        navigateToSecondViewController(withCase: 9)
    }
    @IBAction func elevenButton(_ sender: Any) {
        pageTitle = lableForElevenImage.text
        navigateToSecondViewController(withCase: 10)
    }
    @IBAction func twelveButton(_ sender: Any) {
        pageTitle = lableForTwelveImage.text
        navigateToSecondViewController(withCase: 11)
    }
    @IBAction func thirteenButton(_ sender: Any) {
        pageTitle = lableForThirteenImage.text
        navigateToSecondViewController(withCase: 12)
    }
    @IBAction func fourteenButton(_ sender: Any) {
        pageTitle = lableForFourteenImage.text
        navigateToSecondViewController(withCase: 13)
    }
    @IBAction func fiveteenButton(_ sender: Any) {
        pageTitle = lableForFifteenImage.text
        navigateToSecondViewController(withCase: 14)
    }
    @IBAction func sixteenButton(_ sender: Any) {
        pageTitle = lableForSixteenImage.text
        navigateToSecondViewController(withCase: 15)
    }
    @IBAction func seventeenButton(_ sender: Any) {
        pageTitle = lableForSeventeenImage.text
        navigateToSecondViewController(withCase: 16)
    }
    @IBAction func eighteenButton(_ sender: Any) {
        pageTitle = lableForEighteenImage.text
        navigateToSecondViewController(withCase: 17)
    }

    @IBAction func nineteenButton(_ sender: Any) {
        pageTitle = lableForNineteenImage.text
        navigateToSecondViewController(withCase: 18)
    }
    @IBAction func twentyButton(_ sender: Any) {
        pageTitle = lableForTwentyImage.text
        navigateToSecondViewController(withCase: 19)
    }
    @IBAction func twentyoneButton(_ sender: Any) {
        pageTitle = lableForTwentyOneImage.text
        navigateToSecondViewController(withCase: 20)
    }
    @IBAction func twentytwoButton(_ sender: Any) {
        pageTitle = lableForTwentyTwoImage.text
        navigateToSecondViewController(withCase: 21)
    }
    @IBAction func twentythreeButton(_ sender: Any) {
        pageTitle = lableForTwentyThirdImage.text
        navigateToSecondViewController(withCase: 22)
    }


    func navigateToSecondViewController(withCase caseIndex: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        secondVC.caseIndex = caseIndex
        secondVC.pageTitle = pageTitle
        navigationController?.pushViewController(secondVC, animated: true)
    }

    func performGETRequest() {

        guard let getURL = URL(string: "https://server-prod.pasv.us/flash/group/list/all") else {
            print("Invalid URL")
            return
        }

        var getRequest = URLRequest(url: getURL)
        getRequest.httpMethod = "GET"
        getRequest.setValue("S_#dYd23*H_Da3!#gjLdsK:dSdOfd", forHTTPHeaderField: "Mobile-App-Token")

        let getTask = URLSession.shared.dataTask(with: getRequest) { [self] data, response, error in
            if let error = error {
                print("Error fetching interview groups: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            // Process data here
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let payload = json?["payload"] as? [[String: Any]] {
                    let interviewGroups = payload.map { group -> [String: Any] in
                        guard let name = group["name"] as? String,
                              let image = group["image"] as? String else {
                            return [:]
                        }
                        return ["name": name, "image": image]
                    }
                    if let group = interviewGroups.first, let _ = group["name"] as? String, let _ = group["image"] as? String {

                        for (index, group) in interviewGroups.enumerated() {
                            if let name = group["name"] as? String, let image = group["image"] as? String {

                                DispatchQueue.main.async {
                                    let imageURL = URL(string: image)
                                    switch index {
                                    case 0:
                                        self.imageViewFirst.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForFirstImage.text = name

                                    case 1:
                                        self.imageViewSecond.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForSecondImage.text = name

                                    case 2:
                                        self.imageViewThird.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForThirdImage.text = name


                                    case 3:
                                        self.imageViewFourth.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForFourthImage.text = name
                                    case 4:
                                        self.imageViewFive.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForFiveImage.text = name
                                    case 5:
                                        self.imageViewSix.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForSixImage.text = name
                                    case 6:
                                        self.imageViewSeven.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForSevenImage.text = name
                                    case 7:
                                        self.imageViewEight.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForEightImage.text = name
                                    case 8:
                                        self.imageViewNine.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForNineImage.text = name
                                    case 9:
                                        self.imageViewTen.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForTenImage.text = name
                                    case 10:
                                        self.imageViewEleven.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForElevenImage.text = name
                                    case 11:
                                        self.imageViewTwelve.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForTwelveImage.text = name
                                    case 12:
                                        self.imageViewThirteen.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForThirteenImage.text = name
                                    case 13:
                                        self.imageViewFourteen.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForFourteenImage.text = name
                                    case 14:
                                        self.imageViewFifteen.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForFifteenImage.text = name
                                    case 15:
                                        self.imageViewSixteen.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForSixteenImage.text = name
                                    case 16:
                                        self.imageViewSeventeen.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForSeventeenImage.text = name
                                    case 17:
                                        self.imageViewEighteen.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForEighteenImage.text = name
                                    case 18:
                                        self.imageViewNineteen.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForNineteenImage.text = name
                                    case 19:
                                        self.imageViewTwenty.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForTwentyImage.text = name
                                    case 20:
                                        self.imageViewTwentyOne.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForTwentyOneImage.text = name
                                    case 21:
                                        self.imageViewTwentyTwo.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForTwentyTwoImage.text = name
                                    case 22:
                                        self.imageViewTwentyThird.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
                                        self.lableForTwentyThirdImage.text = name
                                    default:
                                        break
                                    }
                                }
                            }
                        }
                    }
                }
            } catch {
                print("Error decoding interview groups JSON: \(error.localizedDescription)")
            }
        }
        getTask.resume()
    }
}
