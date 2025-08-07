# NCERT QuestionBank AI: Backend Structure

## 1. Database Schema

```typescript
// Database Schema
interface QuestionSchema {
  id: string;
  subject: Subject;
  class: number;
  chapter: string;
  subtopic?: string;
  question_type: "MCQ" | "Assertion-Reason" | "Numerical" | "Short Answer";
  difficulty: "Easy" | "Medium" | "Hard";
  bloom_taxonomy: "Remember" | "Understand" | "Apply" | "Analyze";
  exam_pattern: "CBSE" | "NEET" | "JEE" | "ICSE";
  question_text: string;
  options?: string[];
  correct_answer: string;
  explanation: string;
  generated_at: timestamp;
  user_id: string; // The user who generated the question
}

interface UserSchema {
    id: string;
    email: string;
    role: "student" | "teacher";
    // other user details
}

interface ClassroomSchema {
    id: string;
    teacher_id: string;
    name: string;
    students: string[]; // array of student ids
}

interface QuizSchema {
    id: string;
    teacher_id: string;
    classroom_id: string;
    questions: string[]; // array of question ids
    // other quiz details
}
```

## 2. AI Integration Layer

```python
# Prompt Engineering Template
class QuestionGenerator:
    def __init__(self):
        self.system_prompt = """
        You are an expert NCERT curriculum specialist and question paper setter.
        Generate questions that:
        - Align exactly with NCERT learning outcomes
        - Match CBSE exam patterns and difficulty distribution
        - Include varied cognitive levels (Bloom's Taxonomy)
        - Incorporate real-world applications where relevant
        """

    def generate_question_batch(self,
                               subject: str,
                               chapter: str,
                               question_types: List[str],
                               difficulty_mix: Dict[str, int],
                               count: int = 20) -> List[Question]:

        context = self.load_chapter_context(subject, chapter)

        prompt = f"""
        Context: {context}

        Generate {count} questions with this distribution:
        - MCQs: {difficulty_mix['mcq']} (1 mark each)
        - Assertion-Reason: {difficulty_mix['ar']} (1 mark each)
        - Short Answer: {difficulty_mix['sa']} (2-3 marks each)
        - Long Answer: {difficulty_mix['la']} (5 marks each)

        Requirements:
        - Each question must be directly derivable from NCERT content
        - Include clear marking scheme and expected answer length
        - Vary question stems and avoid repetitive patterns
        - Ensure factual accuracy and current syllabus alignment
        """

        return self.model.generate(prompt, max_tokens=2048)
```

## 3. Quality Assurance System

```json
{
  "validation_pipeline": {
    "content_accuracy": "Cross-reference with NCERT official content",
    "curriculum_alignment": "Map to specific learning outcomes",
    "difficulty_calibration": "Statistical analysis of student performance",
    "language_quality": "Grammar, clarity, and age-appropriateness checks"
  },
  "feedback_loop": {
    "teacher_ratings": "5-star system with specific improvement suggestions",
    "student_performance": "Track question-level success rates",
    "expert_review": "Monthly audit by subject matter experts"
  }
}
```

## 4. Revenue Model Implementation

```typescript
// Subscription Tiers
interface PricingTier {
  name: string;
  price_monthly: number;
  features: Feature[];
  limits: UsageLimits;
}

const PRICING_TIERS: PricingTier[] = [
  {
    name: "Free",
    price_monthly: 0,
    features: ["5 quizzes/month", "Basic MCQs only", "Self-assessment"],
    limits: { quizzes_per_month: 5, question_types: ["MCQ"] }
  },
  {
    name: "Student Pro",
    price_monthly: 249, // ₹249/month
    features: [
      "Unlimited quiz generation",
      "All question types (MCQ, AR, Numerical, SA)",
      "Performance analytics dashboard",
      "Chapter-wise progress tracking",
      "Offline PDF export",
      "Personalized difficulty adjustment"
    ],
    limits: { quizzes_per_month: -1, question_types: "all" }
  },
  {
    name: "Teacher Pro",
    price_monthly: 399, // ₹399/month
    features: [
      "All Student Pro features",
      "Classroom management (up to 50 students)",
      "Assignment creation and distribution",
      "Detailed student progress reports",
      "Custom question modification",
      "Bulk PDF export with answer keys"
    ],
    limits: { students_per_class: 50, custom_questions: true }
  }
];
```
