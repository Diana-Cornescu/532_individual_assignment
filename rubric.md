# Individual Assignment Rubric & Deductions

## 1. Submission and Deployment (20)

- **Goal**: Functional app deployed on your own Posit Connect Cloud instance with a stable URL linked in the repo's About section; public GitHub repository submitted on Gradescope.
- **Deductions**:
  - -20: No deployment exists on Posit Connect Cloud.
  - -15: Deployment crashes on load.
  - -5: Deployed URL not linked in the repo About section.
  - -5: Repository is private (not publicly accessible).
  - -3: No Gradescope submission.

---

## 2. Language Switch (10)

- **Goal**: App is implemented in the alternate Shiny language (R if your group project uses Python; Python if your group project uses R). If another framework was used, prior instructor approval is required.
- **Deductions**:
  - -10: App uses the same language as the group project without instructor approval.

---

## 3. App Requirements (50)

- **Goal**: The app re-implements the group project's core functionality in the alternate language with at least 1 input component, 1 reactive calc, and 2 output components.

### 3.1 Input Component (10)

- **Deductions**:
  - -10: No input component present (slider, dropdown, radio button, etc.).

### 3.2 Reactive Calc (15)

- **Deductions**:
  - -15: No reactive calc present.
  - -8: A reactive calc exists but does not drive any output or is not connected to an input.

### 3.3 Output Components (25)

- **Goal**: At least 2 output components (value boxes, plots, tables, maps, etc.) that react to the reactive calc.
- **Deductions**:
  - -25: Fewer than 2 output components present.
  - -10: Only 1 output component present.
  - -8: Output components are present but do not react to input changes.
  - -5: Output components are present but unreadable (missing labels, titles, or axes).

---

## 4. README (20)

- **Goal**: `README.md` describes the app's purpose, includes instructions for installing packages and running the app locally, and links to the deployed app in the About section metadata.
- **Deductions**:
  - -10: README is missing entirely.
  - -8: README contains no installation or run instructions.
  - -5: README does not describe the app's purpose.
  - -3: About section metadata does not link to the deployed app.
