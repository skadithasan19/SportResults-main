# MVVM architecture

![architecture](https://github.com/skadithasan19/SportResults-main/assets/6060441/1591ad85-c3f0-41c8-a3d9-33d24180aa13)

•	Decoupled Presentation, Business Logic, and Data Access layers
•	Full test coverage, including the UI
•	Redux/Combine like centralized AppState as the single source of truth
•	Programmatic navigation (deep links support)
•	Simple yet flexible networking layer built on Generics
•	Handling of the system events (blurring the view hierarchy when the app is inactive)


Sample App structure and Data flow

SportsViewModel: ViewModel
1. ViewModel Implement SportsResultProtocol for making API call and Loadable Protocol is responsible for loading results by states(loading, loaded, failed)
2. After getting the results I am sorting them by date right away before loading the results to UI. The most recent result on top


View
1. SportResultsApp setting up the landing page for showing the “Get Result” button. After tapping it user see the lists
2. In ContentView I am using Asyncloadableview for showing loading animation as per the design
3. According to the given design I build the text but I also added the time label to see the right order by time
4.   buildGameResultView: method build the Result cell by pulling the right model data

Adding More types to sports

1. First we need to create a new Model like others and then set a new enum type in SportModel enum 
2. Parse new model like other and load it in the array in SportsBucket


<img width="661" alt="Screen Shot 2021-10-25 at 1 15 45 AM" src="https://user-images.githubusercontent.com/6060441/138643722-52b28d10-4865-4caa-a781-2f5134246ff3.png">
