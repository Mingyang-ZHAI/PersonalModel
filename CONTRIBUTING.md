# Contributing to Personalized LLM Assistant

Thank you for your interest in contributing to our project! We welcome contributions from the community.

## 🤝 How to Contribute

### Reporting Issues

Before creating an issue, please:

1. Check if the issue has already been reported
2. Use the issue template and provide detailed information
3. Include system information, error messages, and steps to reproduce

### Suggesting Features

We welcome feature suggestions! Please:

1. Check if the feature has already been requested
2. Explain the use case and benefits
3. Provide examples if possible

### Code Contributions

#### Prerequisites

- Docker Desktop
- Git
- Basic knowledge of Docker and batch scripting

#### Development Setup

1. Fork the repository
2. Clone your fork locally
3. Create a feature branch
4. Make your changes
5. Test thoroughly
6. Submit a pull request

#### Code Style Guidelines

- Use clear, descriptive commit messages
- Follow existing code formatting
- Add comments for complex logic
- Test your changes before submitting

#### Testing

Before submitting a PR, please:

1. Test on a clean Windows environment
2. Verify all batch scripts work correctly
3. Check that Docker containers start properly
4. Ensure the web interface is accessible

## 📋 Pull Request Process

1. **Fork and Clone**
   ```bash
   git clone https://github.com/yourusername/PersonalizationModel.git
   cd PersonalizationModel
   ```

2. **Create Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Changes**
   - Implement your feature/fix
   - Update documentation if needed
   - Test your changes

4. **Commit Changes**
   ```bash
   git add .
   git commit -m "Add: brief description of your changes"
   ```

5. **Push and Submit PR**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create Pull Request**
   - Use the PR template
   - Describe your changes clearly
   - Link any related issues

## 🏷️ Commit Message Format

Use conventional commit format:

```
type(scope): description

[optional body]

[optional footer]
```

Examples:
- `feat(ui): add dark mode support`
- `fix(docker): resolve port conflict issue`
- `docs(readme): update installation instructions`

## 🧪 Testing Guidelines

### Manual Testing Checklist

- [ ] Docker containers start successfully
- [ ] Web interface is accessible at localhost:8080
- [ ] All batch scripts execute without errors
- [ ] Network access configuration works
- [ ] Model downloads complete successfully
- [ ] Personalization settings are applied correctly

### Automated Testing

We're working on adding automated tests. For now, please:

1. Test on Windows 10/11
2. Verify with different Docker versions
3. Check compatibility with various Ollama models

## 📚 Documentation

When contributing, please:

1. Update relevant documentation
2. Add comments to complex code
3. Include examples for new features
4. Update README if needed

## 🐛 Bug Reports

Please include:

- **OS Version**: Windows 10/11
- **Docker Version**: Output of `docker --version`
- **Error Messages**: Full error text
- **Steps to Reproduce**: Detailed steps
- **Expected vs Actual Behavior**: Clear description

## 💡 Feature Requests

Please include:

- **Use Case**: Why this feature is needed
- **Proposed Solution**: How it should work
- **Alternatives Considered**: Other approaches
- **Mockups/Screenshots**: If applicable

## 📞 Getting Help

- **Issues**: [GitHub Issues](https://github.com/yourusername/PersonalizationModel/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/PersonalizationModel/discussions)
- **Email**: your-email@example.com

## 🙏 Recognition

Contributors will be:

- Listed in the README
- Mentioned in release notes
- Given credit in the project documentation

Thank you for contributing to make this project better! 🚀
