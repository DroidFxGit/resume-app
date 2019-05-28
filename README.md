# DroidFx's Resume App

This App represents my own resume on a Native Swift application using a simple MVP arquitecture. 

# Summary

This application implements three sections. Main Screen where general information is shown, Projects section where shows a summary of my most recent project where I've collaborated and finally Experience section where shows companies where I've collaborated through this time.

# Instructions

From your computer in a terminal run ```git clone https://github.com/DroidFxGit/resume-app.git``` or select the option ```Download Zip```

Implementation is composed by main application that contains all the code that implements the application, then there are some unit tests ```ResumeServiceTests``` which basically contains three scenarios of the resume response that is storaged on a github link. If you want to experiment with the main link you can find it on ```Info.plist``` variable is called *mainURL*.

Finally there are one UI test flow ```InteractionUITests``` that implements some UI interactions to check UI behaves as expected.

Unit tests works with some Mocked objects that allows Testing without depending of Network connection, If you want to experiment with Mocked data you can use *mock_response.json* and see different scenarios of ```XCTests```.

DroidFx - ©2019
