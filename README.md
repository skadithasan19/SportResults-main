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
1. The network folder has all related classes for making API calls and Services. our view model directly communicates with services. in order to access service every viewModel has to implement a designated service protocol
Ex. ViewModel Implement SportsResultProtocol for making API calls and Loadable Protocol is responsible for loading results by states(loading, loaded, failed)
2. View is just responsible for observing the property wrapper(@Published) we have in ViewModel
3. For Every ViewModel we can inject APISession so it's easy for a developer to mock the session with stubs and get the results for testing

UI

<img width="972" alt="Screenshot 2023-08-31 at 8 53 58 AM" src="https://github.com/skadithasan19/SportResults-main/assets/6060441/e83ad878-e3a9-4c0c-bed9-13152691b582">
