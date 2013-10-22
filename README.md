#iOS-BootstrapButton-Demo

This project once was a fork of mattlawers BButton, but the extracted, separate subproject is much better to integrate with existing projects.
The codebase was reworked to be usable without coding, almost exclusively with Xcode5.
NEW: BRadioButtons to replace Apple's beasty SegmentedControl!
This is XCode5 Project Demo Wrapper for iOS-BootstrapButton, which is included as subproject.
The subproject architecture prevents importing Xcode and screenshot resources to your target project. No mess, I guess.

BButton is a subclass of UIButton that looks like the [Twitter Bootstrap 2.3.1](http://twitter.github.com/bootstrap) buttons.

#Adding BootstrapButton to your project

git submodule add git@github.com:katzlbt/iOSBootstrapButton.git BootstrapButton
XCode5 will ask you "Share working copy?" Answer: NO (not sure what this means though)

#Using BootstrapButton in your project

In InterfaceBuilder change the class-name of your Button from UIButton to BButton. That's it.

