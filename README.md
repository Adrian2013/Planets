# Planets - iOS Demo App

## Summary

This app will show planets in a list. If we click an item in the list app will navigate to the detail view.
The following items will show in detail view.

* Planet Name 
* Orbital Period 
* Gravity 

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


