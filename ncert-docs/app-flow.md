# NCERT QuestionBank AI: App Flow

## 1. User Persona Mapping

*   **Primary User (Teacher)**: Creates quizzes and assignments, tracks student progress.
*   **Secondary User (Student)**: Practices questions, tracks their own progress, and prepares for exams.
*   **AI Agent (Llama 3.1 / Gemma 7B)**: Generates questions and provides explanations.

## 2. Screen-by-Screen Navigation

### 2.1. Landing/Login Screen

*   Users can log in or sign up.
*   Teachers and students have different registration and login flows.
*   Authentication via Supabase Auth.

### 2.2. Teacher Dashboard

*   Create a new quiz or assignment.
*   View existing quizzes and assignments.
*   Manage classrooms and students.
*   View student progress reports.

### 2.3. Student Dashboard

*   Select a subject, class, and chapter to practice.
*   Take a quiz.
*   View performance analytics.
*   Track chapter-wise progress.

### 2.4. Quiz Generation Flow (Teacher)

1.  Select "Create Quiz".
2.  Choose subject, class, chapter, and sub-topics.
3.  Specify the number of questions and difficulty mix (Easy, Medium, Hard).
4.  Select question types (MCQ, Assertion-Reason, etc.).
5.  The AI generates the quiz.
6.  The teacher can review, edit, or regenerate questions.
7.  The teacher saves the quiz and can assign it to a class.

### 2.5. Quiz Taking Flow (Student)

1.  Select a quiz to take.
2.  The student answers the questions one by one.
3.  After submitting the quiz, the student sees their score, the correct answers, and explanations.

## 3. Core Flow Considerations

*   All navigation must be intuitive and responsive.
*   The application state will be managed using Next.js.
*   Error handling will prevent application crashes.
*   Authentication state will persist across sessions.
*   All AI interactions will be handled asynchronously to avoid blocking the UI.
