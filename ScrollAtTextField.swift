//This is the class for show/hide keyboard and accordingly scrolls scrollView with multiple textfields or UIControls | Swift 4
import UIKit
class ViewController: UIViewController, UITextFieldDelegate  {
  
  //MARK: - Variables
  var activeField: UITextField?
  //---------------------------------
  
  //MARK: - IBOutlets
  @IBOutlet weak var firstTextField: UITextField!
  @IBOutlet weak var secondTextField: UITextField!
  @IBOutlet weak var scrollView: UIScrollView!
  //---------------------------------
  
  
  //MARK: - ViewController LifeCycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated:Bool) {
    super.viewWillAppear(animated)
    //Add observer to detect keyboard open and close event
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(kbNotification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(kbNotification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    //Remove observer
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
  }
  //---------------------------------
  
  
  //MARK: - UITextField Delegate Methods
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    //Store textfield instance to variable for scroll calculation
    activeField = textField
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    //Remove textfield instance from variable
    activeField = nil
  }
  //---------------------------------
  
  
  //MARK: - NotificationCenter Selector or Receiver Methods
  //Called when the UIKeyboardWillHide is sent
  @objc func keyboardWillBeHidden(kbNotification: NSNotification) {
    //Reset the scrollView postion
    let contentInsets: UIEdgeInsets = UIEdgeInsets.zero
    self.scrollView.contentInset = contentInsets
    self.scrollView.scrollIndicatorInsets = contentInsets
    self.scrollView.scrollRectToVisible(CGRect.zero, animated: true)
  }
  
  //Called when the UIKeyboardWillShow is sent
  @objc func keyboardWillShow(kbNotification: NSNotification) {
    //Get userInfo dictionary and store keyboard size for scroll calculation
    var info: [String : AnyObject] = kbNotification.userInfo! as! [String : AnyObject]
    let kbSize: CGSize = (info[UIKeyboardFrameEndUserInfoKey]?.cgRectValue.size)!
    let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
    var aRect: CGRect = self.view.frame
    aRect.size.height -= kbSize.height
    if !aRect.contains(activeField!.frame.origin) {
      //Set scrollView frame using activeField position and size
      let resultedScrollViewFrame = CGRect(x: 0,
                                           y: activeField!.frame.origin.y+activeField!.frame.size.height,
                                           width: scrollView.frame.size.width,
                                           height: scrollView.frame.size.height)
      self.scrollView.scrollRectToVisible(resultedScrollViewFrame, animated: true)
    }
  }
  //---------------------------------
  
  
  //MARK: - IBActions
  @IBAction func onClickSubmit(_ sender: UIButton) {
    activeField?.resignFirstResponder()
  }
  //---------------------------------
}
