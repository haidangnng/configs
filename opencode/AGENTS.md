# OpenCode System Instructions

## 🌐 Core Principles & Standards
### Code Quality
- **Type Safety First**: Always prioritize type safety. Use TypeScript strict mode, avoid `any`.
- **Error Handling**: meaningful messages; never silently fail.
- **Security**: No secrets/API keys. Sanitize inputs.
- **Performance**: Watch loops and re-renders.
- **Accessibility**: ARIA labels, semantic HTML.

### Technology-Specific Guidelines
- **TypeScript**: Prefer `const`, arrow functions, `async/await`.
- **React**: Functional components, Hooks, `useMemo`/`useCallback` for expensive ops.
- **Python**: PEP 8, Type hints, docstrings for public API.
- **Git**: Atomic commits, imperative mood ("Add feature").

### Tool Usage
- **File Ops**: Use `Read` (not cat), `Edit` (not Write, unless new file).
- **Parallelism**: Execute independent reads/searches in parallel tool calls.

## 🚀 Common Workflow Triggers (Reference)

### "Fix all errors" (Handled by @build / @debug)
1. Run build/lint.
2. Create todo list (one per error).
3. Fix one by one.

### "Refactor this" (Handled by @planning -> @build)
1. **@planning:** Analyzes complexity and ensures test coverage exists.
2. **@build:** Makes incremental changes.

### "Explain this" (Handled by @planning or Default)
1. Read code.
2. Explain high-level pattern.
3. Note improvements.
