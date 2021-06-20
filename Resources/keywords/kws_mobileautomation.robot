*** Settings ***
Documentation        Aqui estarão todos os testes mobile do curso.

Test Setup            
Task Teardown

Library         AppiumLibrary

*** Variables ***

${EMAIL}            testesoftware1619@gmail.com 
${SENHA}            teste@123

*** Keywords ***
Abrir o aplicativo
    Open Application           http://localhost:4723/wd/hub 
    ...                        automationName=UiAutomator2
    ...                        platformName=Android
    ...                        deviceName=HCAZB600X201EEX
    ...                        autoGrantPermissions=true
    ...                        appPackage=com.google.android.youtube
    ...                        appActivity=com.google.android.youtube.HomeActivity

Fechar o aplicativo
    Capture Page Screenshot    
    Close Application            

Verifique se estou na tela home do youtube
    Wait Until Element Is Visible    accessibility_id=YouTube

# DESAFIO 1
Logar no aplicativo com a conta x 
    Click Element                    accessibility_id=Conta
    Wait Until Element Is Visible    id=com.google.android.youtube:id/button
    Click Element                    id=com.google.android.youtube:id/button
    Wait Until Element Is Visible    id=com.google.android.youtube:id/add_account
    Click Element                    id=com.google.android.youtube:id/add_account
    Sleep                            10
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[1]/android.widget.EditText
    Input Text                       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View[1]/android.widget.EditText    ${EMAIL}
    Click Element                    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[4]/android.view.View/android.widget.Button
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View
    Input Text                       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[3]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View[1]/android.widget.EditText    ${SENHA}
    Click Element                    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView
    Click Button                     xpath=//*[@id="passwordNext"]/div/button

Verificar se a conta "${ACCOUNT}" foi logada
  Click Button                    xpath=//*[@id="header-bar"]/header/div/ytm-topbar-menu-button-renderer/button
  Click Element                   xpath=//*[@id="menu"]/div/ytm-multi-page-menu-renderer/div/ytm-active-account-header-renderer/div[1]/div/div[1]/c3-icon
  Element Should Be Visible       xpath=//*[@id="menu"]/div/ytm-multi-page-menu-renderer/div/ytm-account-section-list-renderer[1]

Entrar no menu “${EXPLORER}”
  Click Element                   accesibility_id=Explorar
  Element Should Be Visible       xpath=//*[@id="app"]/div[1]/ytm-browse/ytm-single-column-browse-results-renderer/div/div/ytm-section-list-renderer/ytm-channel-list-sub-menu-renderer/div

Usar swipe de tela até o 10 item da tela
    FOR   ${VAR}  IN  0   10
        Swipe   533   495   533    100
    ${VAR}=   Set Variable    ${VAR}+1  
    END
    Click Element                   xpath=//*[@id="app"]/div[1]/ytm-browse/ytm-single-column-browse-results-renderer/div/div/ytm-section-list-renderer/lazy-list/ytm-item-section-renderer[12]

        