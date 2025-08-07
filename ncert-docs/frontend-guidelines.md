# NCERT QuestionBank AI: Frontend Guidelines

## 1. Design System

```css
/* Design System */
:root {
  --primary-blue: #1565C0; /* Educational trust color */
  --success-green: #2E7D32; /* Correct answers */
  --warning-amber: #F57C00; /* Review needed */
  --error-red: #C62828; /* Incorrect answers */
  --surface-elevation: 0 2px 8px rgba(0,0,0,0.1);
  --border-radius: 12px;
  --typography-scale: 1.125; /* Perfect Fourth scale */
}
```

## 2. Responsive Grid System

```css
/* Responsive Grid System */
.question-container {
  display: grid;
  grid-template-columns:
    [mobile] 1fr
    [tablet] repeat(2, 1fr)
    [desktop] repeat(3, 1fr);
  gap: clamp(1rem, 2vw, 2rem);
  margin-inline: max(1rem, 5vw);
}
```

## 3. Component-Driven Design

*   **Reusable Components**: Create a library of reusable components for UI consistency (e.g., buttons, inputs, modals).
*   **Question Component**: A dedicated component to display questions, options, and explanations.
*   **Dashboard Widgets**: Components for displaying stats and charts on the user dashboards.

## 4. AI Integration Guidelines

*   **Loading States**: Implement loading states for when the AI is generating questions.
*   **Error States**: Implement error states for when the AI fails to generate questions.
*   **Streaming Responses**: Where possible, stream responses from the AI to improve perceived performance.

## 5. UI/UX Consistency

*   **Clarity and Simplicity**: The UI should be clean, intuitive, and easy to navigate for both teachers and students.
*   **Accessibility**: Ensure the application is accessible to users with disabilities (WCAG compliance).
*   **Feedback**: Provide clear feedback to users for their actions (e.g., success messages, error messages).
