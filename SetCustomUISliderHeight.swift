//To set customize UISlider height | Swift version: 4
//Steps:
//[1] Add "CustomSlider" class in your swift file as per your requirment.
//[2] Set "CustomSlider" in custom class in UISlider control.
//[3] Set "progressLineHeight" value as you want.
class CustomSlider: UISlider { 
  
  //To set line height value from IB, here ten is default value
  @IBInspectable var trackLineHeight: CGFloat = 10
  
  //To set custom size of track so here override trackRect function of slider control
  override func trackRect(forBounds bound: CGRect) -> CGRect {
    //Here, set track frame
    return CGRect(origin: bound.origin, size: CGSize(width: bound.width, height: trackLineHeight))
  }
}
