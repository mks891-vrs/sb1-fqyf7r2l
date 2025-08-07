## Document 6: Jules Development Rules Document

### Purpose
AI-specific coding standards optimized for Jules' Google Cloud environment

### Jules Enhancement
Context-aware rule application with Google services integration and instant feedback

### Essential Jules + Google Rules

#### 1. File Organization (Jules + Google Optimized)
```
src/
├── components/              # Reusable UI components
│   ├── ui/                 # Basic Material Design 3 components
│   ├── features/           # Feature-specific components
│   └── google/             # Google services components
├── pages/                  # Route components
├── hooks/                  # Custom React hooks + Firebase hooks
├── services/               # Google Cloud services
│   ├── firebase.ts         # Firebase configuration
│   ├── googleAI.ts        # AI/ML services
│   └── googleAPIs.ts      # Other Google APIs
├── types/                  # TypeScript + Google Cloud types
├── utils/                  # Utility functions
└── context/               # React context + Firebase providers

functions/
├── src/                   # Firebase Cloud Functions
└── package.json

firestore.rules             # Firestore security rules
storage.rules              # Cloud Storage rules
firebase.json              # Firebase configuration
```

#### 2. Component Standards (Jules + Google Compatible)
```typescript
// Jules + Google optimized component template
import { useAuthState } from 'react-firebase-hooks/auth';
import { auth } from '../services/firebase';

interface GoogleIntegratedComponentProps {
  title: string;
  onAIAction?: (message: string) => Promise<void>;
  className?: string;
  googleService?: 'drive' | 'calendar' | 'maps';
}

export const JulesGoogleComponent: React.FC<GoogleIntegratedComponentProps> = ({
  title,
  onAIAction,
  className = '',
  googleService
}) => {
  const [user, loading, error] = useAuthState(auth);

  const handleAIInteraction = async () => {
    if (onAIAction && user) {
      await onAIAction("Hello from Jules + Google!");
    }
  };

  if (loading) return <div className="animate-pulse">Loading...</div>;
  if (error) return <div className="text-red-500">Error: {error.message}</div>;

  return (
    <div className={`bg-white rounded-lg shadow-md p-6 ${className}`}>
      <h2 className="text-xl font-semibold text-gray-900 mb-4">{title}</h2>

      {user && (
        <div className="flex items-center space-x-3 mb-4">
          <img
            src={user.photoURL || '/default-avatar.png'}
            alt={user.displayName || 'User'}
            className="w-8 h-8 rounded-full"
          />
          <span className="text-sm text-gray-600">
            Signed in as {user.displayName}
          </span>
        </div>
      )}

      {onAIAction && (
        <button
          onClick={handleAIInteraction}
          className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors"
        >
          Ask AI Assistant
        </button>
      )}
    </div>
  );
};
```

#### 3. Error Handling (Jules + Google Safe)
```typescript
// Error boundaries for Jules + Google Cloud stability
import { Component, ReactNode } from 'react';

interface JulesErrorBoundaryState {
  hasError: boolean;
  error?: Error;
  errorInfo?: any;
}

class JulesGoogleErrorBoundary extends Component<
  { children: ReactNode },
  JulesErrorBoundaryState
> {
  constructor(props: { children: ReactNode }) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error: Error): JulesErrorBoundaryState {
    return { hasError: true, error };
  }

  componentDidCatch(error: Error, errorInfo: any) {
    // Log to Google Cloud Logging
    console.error('Jules Error Boundary:', error, errorInfo);

    // Optional: Send to Google Cloud Error Reporting
    // errorReporting.report(error);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div className="min-h-screen flex items-center justify-center bg-gray-50">
          <div className="max-w-md w-full bg-white rounded-lg shadow-lg p-6">
            <div className="flex items-center mb-4">
              <div className="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center">
                <svg className="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.082 16.5c-.77.833.192 2.5 1.732 2.5z" />
                </svg>
              </div>
              <div className="ml-4">
                <h3 className="text-lg font-semibold text-gray-900">Something went wrong</h3>
                <p className="text-sm text-gray-600">Check the Jules console and Google Cloud logs for details.</p>
              </div>
            </div>
            <button
              onClick={() => window.location.reload()}
              className="w-full px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors"
            >
              Reload Application
            </button>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}
```

#### 4. Performance (Jules + Google Optimized)
- Use React.memo for expensive components with Firebase data
- Implement lazy loading for Google service integrations
- Optimize images with Google Cloud Storage and CDN
- Minimize bundle size with tree shaking and code splitting
- Cache Google API responses appropriately
- Use Firebase real-time listeners efficiently

#### 5. Testing in Jules + Google
- Manual testing in Jules preview with Firebase emulator
- Google Cloud Function local testing
- Console.log for debugging (visible in browser dev tools)
- Error boundary testing with Google services
- Responsive design testing in Jules' device preview
- AI/ML integration testing with mock responses
