# ContactsApp



# Table of Contents
* I.	  General info
* II. 	Technologies
* III.	Setup
* IV.	  Architecture

## I. General info
This project is a simple contact manager application for iOS.
	
## II. Technologies
Project is created using:
- Swift 5 (UIKit)
- CoreData Framework
	
## III. Setup
You will need a Mac running Xcode to run this application on your device or your simulator.
* Download the project files to your computer.
* Run the "**ContactsApp.xcodeproj**" file.

PS: The app works only for iOS 13.0 and above.


## IV. Architecture

## Design Pattern
Model-View-Controller (MVC)

### IV.I. Data Model
* The data model is created in the CoreData file.

### IV.II. Views
The views are created all **programmatically**. it was created using **UICollectionView** with custom **UICollectionViewCells** embedded in a **Navigation Controller**.

### IV.III. Controllers
* First group of controller (inside group **Delegate Controller**): Used to create a CoreData singleton, to create the main view programmatically.
* Second group of controller(inside groupe **Controllers**: Used to do all the main tasks of the app: Save Contact, Delete contacts, setup image for contacts, format enter phone number, etc.
