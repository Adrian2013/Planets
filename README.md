# Planets - iOS Demo App

## Summary

This app will show planets in a list. If we click an item in the list app will navigate to the detail view.
The following items will show in detail view.

* Planet Name 
* Orbital Period 
* Gravity 


https://user-images.githubusercontent.com/4548032/194476355-d7711bb5-0d0c-4c52-8de7-8e2a1959baf3.mov


## Architecture 
This project follows the MVVM architectural pattern.
MVVM stands for Model View View Model. 

### View 
  The View layer is responsible for handling all the layouts and displaying the data user-friendly. The View knows the ViewModel but doesn't know the   model.
  
### ViewModel 
  The ViewModel layer is responsible for transforming the data received in a View representative way, receiving actions from the View, dealing with our business logic. The data binding tells whoever is listening about those changes. The ViewModel Knows the Model layer but doesn’t know the View layer. 
  
###  Model 
The Model layer is responsible for representing the data from our business logic. The Model doesn’t know any other layer.

## App Structure
I tend to set up my project folder structure like this

![Package](https://user-images.githubusercontent.com/4548032/194442927-c05cefba-3cf2-434c-accd-80c8024b1edb.png)
![AppStructure2](https://user-images.githubusercontent.com/4548032/194400957-5cb781dc-5fda-4f2d-8b5d-fcbb4fa2cde2.png)

## Third-Party Libraries
I am using Swift Package Manager to add external libraries in Xcode project.

![PakageDependencies](https://user-images.githubusercontent.com/4548032/194472078-f33a1de0-ea14-4146-8689-359e92b036dd.png)

### Package Information

* RxSwift 6.5.0 (URL: https://github.com/ReactiveX/RxSwift.git)
* Alamofire 5.5.0  (URL: https://github.com/Alamofire/Alamofire.git)
* RxDataSources 5.0.2 (URL: https://github.com/RxSwiftCommunity/RxDataSources.git)





