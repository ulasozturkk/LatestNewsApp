
# News Application

This application is an iOS app that retrieves and filters news headlines and articles from NewsAPI.

## Technologies Used

- **MVVM:** The app follows the Model-View-ViewModel architecture, providing a modular and testable structure.

- **Codable:** Codable protocol is used for transforming JSON data into Swift objects and vice versa.

- **SPM (Swift Package Manager):** External dependencies are managed using SPM for a streamlined and efficient development process.

- **Delegation:** Delegation pattern is employed for communication between components, enhancing modularity and separation of concerns.

- **Kingfisher:** Kingfisher library is utilized for asynchronous image loading and caching.

- **Generic Network Layer:** A generic network layer is implemented to handle API requests, promoting reusability and maintainability.

- **Closure:** Closures are leveraged for handling asynchronous operations, ensuring a responsive and smooth user experience.

- **Programmatic UI with Extension:** The user interface is constructed programmatically, utilizing Swift extensions for cleaner and more maintainable code.

## Getting Started

Follow these steps to set up and run the project on your local machine:

1. Clone the repository:

```bash
git clone https://github.com/ulasozturkk/news-app.git
```
2. Go https://newsapi.org and get your api key
3. Open project on xCode
4. Open /Service/core/NetworkHelper and paste your api key on line 20
   ```bash
   static let apiKey = "YOUR-API-KEY"
   ```
6. Build and run your app with simulator or connected device

## Screenshots

Every Articles Filtering Screen

![Every Articles Filtering Screen](/screenshots/EveryArticlesFiltering.png)


Every Articles Screen

![every](/screenshots/EveryArticles.png)


Top Headlines Filtering Screen

![top](/screenshots/TopHeadlinesFiltering.png)


Top Headlines

![toph](/screenshots/TopHeadlines.png)

