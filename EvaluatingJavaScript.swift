  //This is the code to change font size and avoid text copy functionality from entire html in UIWebView | Swift version: 4
  //"textSize": this is integer variable which you want to set font size
  func webViewDidFinishLoad(_ webView: UIWebView) {    
    if (webView.stringByEvaluatingJavaScript(from: "document.readyState") == "complete") {
      //To avoid to detect touch gesture for disable user selection
      webView.stringByEvaluatingJavaScript(from: "document.documentElement.style.webkitUserSelect='none';")
      webView.stringByEvaluatingJavaScript(from: "document.documentElement.style.webkitTouchCallout='none';")
      //-----
      
      //To set font size
      let jsString = "document.getElementsByTagName('body')[0].style.fontSize='\(textSize)px'"
      webView.stringByEvaluatingJavaScript(from: jsString)
      //-----
    }
  }
