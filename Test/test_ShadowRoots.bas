Attribute VB_Name = "test_shadowroots"

Sub test_shadow_roots_clear_browser_history()

    Dim Driver As New WebDriver
    Dim webelem1 As WebElement, webelem2 As WebElement, webelem3 As WebElement
    Dim webelem4 As WebElement, webelem5 As WebElement, webelem6 As WebElement
    Dim clearData As WebElement
    'Dim jc As New JSonConverter
        
    Driver.Chrome
    Driver.OpenBrowser
    
    'make some browsing history
    Driver.Navigate "https://www.google.com/"
    Driver.Wait 1000
    Driver.Navigate "chrome://settings/clearBrowserData/"
    Driver.Wait 1000
    
    'work way down the shadowroot tree until we find the clear history button
    Set webelem1 = Driver.FindElement(by.CssSelector, "settings-ui")
    Set webelem2 = webelem1.GetShadowRoot.FindElement(by.CssSelector, "settings-main") 'belongs to shadow root under downloads-manager
    Set webelem3 = webelem2.GetShadowRoot.FindElement(by.CssSelector, "settings-basic-page")     'belongs to shadow root under downloads-manager
    Set webelem4 = webelem3.GetShadowRoot.FindElement(by.CssSelector, "settings-section > settings-privacy-page")
    Set webelem5 = webelem4.GetShadowRoot.FindElement(by.CssSelector, "settings-clear-browsing-data-dialog")
    Set webelem6 = webelem5.GetShadowRoot.FindElement(by.CssSelector, "#clearBrowsingDataDialog")
    
    Set clearData = webelem6.FindElement(by.CssSelector, "#clearBrowsingDataConfirm")
    clearData.Click 'to clear browsing history
    
    Driver.Wait 3000
    
    Driver.CloseBrowser
    Driver.Shutdown

End Sub
