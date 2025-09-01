# Personalized LLM Assistant

[![Docker](https://img.shields.io/badge/Docker-Required-blue?logo=docker)](https://www.docker.com/)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-green)](https://www.microsoft.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Stars](https://img.shields.io/github/stars/yourusername/PersonalizationModel?style=social)](https://github.com/yourusername/PersonalizationModel)

> A powerful, locally-deployed LLM assistant with personalized preferences, built on Ollama + Open WebUI. Deploy your own AI assistant in minutes with one-click setup.

## ✨ Features

- 🚀 **One-Click Deployment** - Get started in minutes with automated setup
- 🎯 **Personalized Responses** - Customize AI behavior with your own preferences
- 🔒 **100% Local** - No data leaves your machine, complete privacy
- 🌐 **Network Access** - Share your assistant across your local network
- 🎨 **Modern Web UI** - Beautiful, responsive interface powered by Open WebUI
- 🔧 **Easy Management** - Simple batch scripts for all operations
- 📊 **Multiple Models** - Support for various LLM models via Ollama
- 💾 **Persistent Data** - Your conversations and settings are preserved

## 🎯 Use Cases

- **Personal AI Assistant** - Your own ChatGPT alternative
- **Research & Writing** - Academic writing with custom style preferences
- **Code Assistant** - Programming help with personalized coding style
- **Content Creation** - Generate content following your specific guidelines
- **Learning Tool** - Educational assistance with tailored explanations

## 🚀 Quick Start

### Prerequisites

- Windows 10/11
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- At least 8GB RAM
- 10GB available disk space

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Mingyang-ZHAI/PersonalModel.git
   cd PersonalizationModel
   ```

2. **Start the service** (Run as Administrator)
   ```bash
   start-service.bat
   ```

3. **Access your assistant**
   ```
   Open http://localhost:8080 in your browser
   ```

That's it! Your personalized AI assistant is ready to use. 🎉

## 🛠️ Management Commands

| Command | Description | Admin Required |
|---------|-------------|----------------|
| `start-service.bat` | Start the AI assistant | ✅ |
| `stop-service.bat` | Stop the service | ❌ |
| `restart-service.bat` | Restart the service | ❌ |
| `show-logs.bat` | View real-time logs | ❌ |
| `setup-network.bat` | Configure network access | ✅ |
| `cleanup.bat` | Complete cleanup | ❌ |

## 🌐 Network Access

Share your assistant with other devices on your network:

```bash
# Configure network access (Run as Administrator)
setup-network.bat
```

Then access from any device using: `http://[your-ip]:8080`

## ⚙️ Configuration

### Personalization Settings

1. Open the web interface at `http://localhost:8080`
2. Go to **Settings** → **Personalization**
3. Paste your preferences from `preference.md` into **System Prompt**
4. Save and enjoy your personalized AI!

### Example Preference Configuration

```markdown
# Your AI Assistant Preferences
1. Write in a clear, professional tone
2. Provide detailed explanations with examples
3. Use markdown formatting for better readability
4. Always cite sources when making claims
```

### Advanced Configuration

Edit `docker-compose.yml` to:
- Change default models
- Enable GPU acceleration
- Modify ports
- Add custom environment variables

## 📊 Performance

| Hardware | Recommended | Minimum |
|----------|-------------|---------|
| **RAM** | 16GB | 8GB |
| **CPU** | 8+ cores | 4 cores |
| **Storage** | SSD | HDD |
| **GPU** | NVIDIA RTX 3060+ | Integrated |

## 🔧 Troubleshooting

### Common Issues

<details>
<summary>Service won't start</summary>

1. Ensure Docker Desktop is running
2. Check if ports 8080/11434 are available
3. Run `show-logs.bat` for detailed error messages
4. Try running as Administrator

</details>

<details>
<summary>Can't access from other devices</summary>

1. Run `setup-network.bat` as Administrator
2. Check Windows Firewall settings
3. Ensure devices are on the same network
4. Verify router doesn't block the ports

</details>

<details>
<summary>Model download fails</summary>

1. Check your internet connection
2. Restart the service: `restart-service.bat`
3. Manually download: `docker exec -it personalization-ollama ollama pull qwen3:4b`

</details>

## 📚 Documentation

- 📖 [Complete Deployment Guide](deployment-guide.md) - Detailed setup and configuration
- 🔧 [Advanced Configuration](deployment-guide.md#advanced-configuration) - Customization options
- 🐛 [Troubleshooting](deployment-guide.md#troubleshooting) - Common issues and solutions
- 💡 [Usage Tips](deployment-guide.md#usage-tips) - Best practices and tips

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Ollama](https://ollama.ai/) - Local LLM inference
- [Open WebUI](https://github.com/open-webui/open-webui) - Beautiful web interface
- [Docker](https://www.docker.com/) - Containerization platform

