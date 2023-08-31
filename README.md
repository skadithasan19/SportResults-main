# MVVM Architecture Guide


![architecture](https://github.com/skadithasan19/SportResults-main/assets/6060441/1591ad85-c3f0-41c8-a3d9-33d24180aa13)

Welcome to the comprehensive guide on the Model-View-ViewModel (MVVM) architectural pattern. MVVM is a powerful design pattern that enhances the separation of concerns in your app, leading to better maintainability and testability. This guide will provide you with a quick understanding of MVVM principles and how they are implemented in this app structure.

## Key Features of MVVM Architecture
**Decoupled Layers:** MVVM promotes the decoupling of the Presentation, Business Logic, and Data Access layers. This separation allows for easier code management and reduces dependencies between different parts of the application.

**Comprehensive Testing:** A crucial aspect of MVVM is its emphasis on test coverage. Our architecture ensures that not only the underlying logic but also the UI components are thoroughly testable. This contributes to more reliable and stable code.

**Centralized AppState:** Inspired by concepts like Redux and Combine, our architecture utilizes a centralized AppState as the single source of truth. This approach simplifies data management and synchronization across different parts of the application.

**Programmatic Navigation:** Our MVVM architecture supports programmatic navigation, including deep link support. This feature enables seamless and controlled navigation within the app, enhancing the user experience.

**Flexible Networking Layer:** We provide a simple yet flexible networking layer built on Generics. This layer streamlines API interactions and ensures consistency in handling network requests and responses.

**System Event Handling:** Our architecture addresses the management of system events, such as blurring the view hierarchy when the app becomes inactive. This ensures a smoother user experience and proper handling of app lifecycle events.

## Sample App Structure and Data Flow

**Network Layer:** The network folder encompasses all classes related to making API calls and services. In our architecture, view models directly communicate with these services. To access a service, each view model adheres to a designated service protocol. For instance, the SportsResultViewModel implements the SportsResultProtocol for making API calls. The Loadable Protocol manages the loading states (loading, loaded, failed) for fetching results.

**View Layer:** The responsibility of the view layer is to observe the property wrappers (@Published) exposed by the view model. This separation ensures that the UI remains separate from the underlying logic, promoting better readability and maintainability.

**Dependency Injection:** Our architecture supports dependency injection by allowing the injection of an APISession into every view model. This design choice facilitates easy mocking of the session with stubs, enhancing the testability of the application and making result retrieval for testing purposes more convenient.

By following this MVVM architecture and adhering to its principles, we can create apps that are modular, scalable, and highly maintainable. The clear separation of concerns, comprehensive testing coverage, and thoughtful design choices empower developers to build high-quality applications that deliver exceptional user experiences.

UI

<img width="972" alt="Screenshot 2023-08-31 at 8 53 58 AM" src="https://github.com/skadithasan19/SportResults-main/assets/6060441/e83ad878-e3a9-4c0c-bed9-13152691b582">
