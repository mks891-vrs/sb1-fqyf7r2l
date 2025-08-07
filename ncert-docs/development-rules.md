# NCERT QuestionBank AI: Development Rules

## 1. File Organization

```
src/
├── app/                  # Next.js App Router
├── components/           # Reusable UI components
│   ├── ui/               # Basic UI components
│   ├── features/         # Feature-specific components
│   └── quiz/             # Components related to quizzes
├── lib/                  # Libraries and utilities
│   ├── auth/             # Authentication logic
│   ├── db/               # Database logic
│   └── ai/               # AI-related logic
├── styles/               # Global styles
└── types/                # TypeScript types
```

## 2. Component Standards

*   **Functional Components**: Use functional components with hooks.
*   **TypeScript**: All components should be written in TypeScript.
*   **Props Validation**: Use TypeScript interfaces for props validation.
*   **State Management**: Use `useState` for local state and `useContext` for global state.

## 3. Error Handling

*   **Error Boundaries**: Use error boundaries to catch and handle errors in the UI.
*   **Async/Await with try/catch**: Use `try/catch` blocks for handling errors in asynchronous code.
*   **Logging**: Log errors to a logging service for debugging.

## 4. Performance

*   **Code Splitting**: Use dynamic imports to code-split pages and components.
*   **Memoization**: Use `React.memo` for memoizing components and `useMemo` for memoizing values.
*   **Image Optimization**: Use the Next.js Image component to optimize images.
*   **Caching**: Use caching strategies to cache data from the database and AI API.

## 5. Testing

*   **Unit Tests**: Write unit tests for individual components and functions.
*   **Integration Tests**: Write integration tests to test the interaction between different parts of the application.
*   **End-to-End Tests**: Write end-to-end tests to test the application from the user's perspective.
*   **Mocking**: Use mocking libraries to mock external dependencies like the database and AI API.
