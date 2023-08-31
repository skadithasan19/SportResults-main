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
1. Network folder has all related classes for making API call and Services. our view model directly communicate with services. in order to access service every viewModel has to implemet designated service protocol
Ex. ViewModel Implement SportsResultProtocol for making API call and Loadable Protocol is responsible for loading results by states(loading, loaded, failed)
2. View is just responsible for observing the property wrapper(@Published) we have in viewModel
3. Every viewModel we can inject APISession so its easy for developer to mock the session with stubs and get the results for testing


<img width="661" alt="Screen Shot 2021-10-25 at 1 15 45 AM" src="https://user-images.githubusercontent.com/6060441/138643722-52b28d10-4865-4caa-a781-2f5134246ff3.png">
