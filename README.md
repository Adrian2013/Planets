# Planets - iOS Demo App

## Summary

This app will show planets in a list. If we click an item in the list app will navigate to the detail view.
The following items will show in detail view.

* Planet Name 
* Orbital Period 
* Gravity 


### Demo


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



Explaining a little bit more of each follder:

### Model 

Where I keep all the Model Objects 

* PlanetModel

* PlanetsResultModel


### View 

Here is where I store the View components, such as cells, custom views, buttons, etc.
Even the name is ViewController, here is the View Part of the MVVM. I use this name due to the UIViewControllers elements from iOS. We shouldn’t have business logic inside any controller, just UI Related code.

* ViewController  : Show the planet list

* DetailViewController : Show planet information


### View Model

Where I keep all the ViewModel Classes. I write business logic in PlanetViewModel class,

* PlanetViewModel : The implementation of getPlanetsList API call(Business Logic) and published the model

### Network
Where I keep all Network API call classes

* AppServerClient - Get planet list from  https://swapi.dev/  api

* APIEndPoints - Implement endpoints to get planet list.  Ex : Handling base url

### Resources
Where I keep all Constants classes


### Extension
Where I keep all Extension classes. Ex:  View+Extension

## Third-Party Libraries
I am using Swift Package Manager to add external libraries in Xcode project.

![PakageDependencies](https://user-images.githubusercontent.com/4548032/194472078-f33a1de0-ea14-4146-8689-359e92b036dd.png)

### Package Information

* RxSwift 6.5.0 (URL: https://github.com/ReactiveX/RxSwift.git)
* Alamofire 5.5.0  (URL: https://github.com/Alamofire/Alamofire.git)
* RxDataSources 5.0.2 (URL: https://github.com/RxSwiftCommunity/RxDataSources.git)

## Troubleshooting

### Issue

After cloning or download project, you will get following error.

<img width="274" alt="Screenshot 2022-10-07 at 2 01 33 PM" src="https://user-images.githubusercontent.com/4548032/194510799-e12b9ec9-6f09-4453-8488-0c2b51c25f7f.png">
<img width="828" alt="Screenshot 2022-10-07 at 1 56 41 PM" src="https://user-images.githubusercontent.com/4548032/194510429-9815d72d-5a99-4425-857f-9850e9c5b5ac.png">

### Soulution

Add package

<img width="577" alt="Screenshot 2022-10-07 at 1 57 09 PM" src="https://user-images.githubusercontent.com/4548032/194511544-802e8cf6-0380-4ee1-a36f-e29c7523e703.png">

<img width="1137" alt="Screenshot 2022-10-07 at 1 57 24 PM" src="https://user-images.githubusercontent.com/4548032/194512222-53b36631-b708-486e-b3d3-e9510684b259.png">


<img width="721" alt="Screenshot 2022-10-07 at 1 57 45 PM" src="https://user-images.githubusercontent.com/4548032/194512297-ec8fc836-b9fd-475c-8f60-b398f9eefcd2.png">

After adding all packages. You can see Package Dependencies section like this and there are no build issues.

<img width="274" alt="Screenshot 2022-10-07 at 1 58 31 PM" src="https://user-images.githubusercontent.com/4548032/194512359-b014e54a-6e5b-4f01-8f8c-6c23ae42bc0d.png">










