# 🤖 Personalized LLM Assistant Deployment Guide

## 📦 Deployment Package Contents

```
PersonalizationModel/
├── docker-compose.yml        # Docker orchestration configuration
├── preference.md              # Personalized preference settings
├── start-service.bat          # Start service
├── stop-service.bat           # Stop service  
├── restart-service.bat        # Restart service
├── show-logs.bat              # View logs
├── cleanup.bat                # Complete cleanup
├── setup-network.bat          # Network configuration
└── deployment-guide.md        # This document
```

## 🚀 Quick Deployment

### Requirements
- Windows 10/11
- At least 8GB RAM
- 10GB available disk space
- Stable network connection

### Step 1: Install Docker
1. Download [Docker Desktop](https://www.docker.com/products/docker-desktop/)
2. Install and start Docker Desktop
3. Ensure Docker is running in the system tray

### Step 2: One-Click Start
1. Copy the entire folder to Windows server
2. **Right-click `start-service.bat`, select "Run as administrator"**
3. Wait for service startup (first startup takes about 5-10 minutes)
4. Browser automatically opens http://localhost:8080

### Step 3: Configure Network Access (Optional)
1. **Right-click `setup-network.bat`, select "Run as administrator"**
2. Note the displayed IP address
3. Other devices can access the service via this IP

## 🌐 Network Access Configuration

### LAN Access
- **Server IP**: Run `setup-network.bat` to get
- **Access URL**: `http://[server-ip]:8080`
- **Ports**: 8080 (Web interface), 11434 (API)

### Internet Access (Optional)
1. Router port forwarding: 8080 → server internal IP:8080
2. Get public IP or use DDNS
3. Access URL: `http://[public-ip]:8080`

## 🛠️ Usage Guide

### Set Personalized Preferences
1. Access Web interface: http://localhost:8080
2. Register admin account (first visit)
3. Click **Settings** → **Personalization**
4. Paste content from `preference.md` in **System Prompt**
5. Save settings

### Management Commands
- **Start Service**: `start-service.bat`
- **Stop Service**: `stop-service.bat`  
- **Restart Service**: `restart-service.bat`
- **View Logs**: `show-logs.bat`
- **Network Config**: `setup-network.bat` (Admin privileges required)
- **Complete Cleanup**: `cleanup.bat`

## 🔧 Advanced Configuration

### Modify Models
Edit `docker-compose.yml`:
```yaml
environment:
  - DEFAULT_MODELS=llama2,qwen3:4b  # Add multiple models
```

### Enable GPU Acceleration (NVIDIA)
Uncomment GPU configuration in `docker-compose.yml`:
```yaml
deploy:
  resources:
    reservations:
      devices:
        - driver: nvidia
          count: 1
          capabilities: [gpu]
```

### Modify Ports
Edit port mapping in `docker-compose.yml`:
```yaml
ports:
  - "8080:8080"  # Change to "8081:8080"
```

## 📊 Performance Optimization

### Hardware Recommendations
- **CPU**: 4+ cores
- **RAM**: 16GB recommended (minimum 8GB)
- **Storage**: SSD recommended
- **GPU**: NVIDIA graphics card (optional, significantly improves performance)

### System Optimization
1. Close unnecessary background programs
2. Set Docker memory limits (Docker Desktop settings)
3. Use SSD for Docker data storage

## 🐛 Troubleshooting

### Common Issues

**Q: Service startup failed**
- Check if Docker is running
- Ensure ports 8080 and 11434 are not occupied
- View logs: run `show-logs.bat`

**Q: Cannot access from other devices**
- Run `setup-network.bat` to configure firewall
- Check if router blocks ports
- Ensure devices are on the same LAN

**Q: Model download failed**
- Check network connection
- Restart service: run `restart-service.bat`
- Manual download: `docker exec -it personalization-ollama ollama pull qwen3:4b`

**Q: Insufficient memory**
- Use smaller models (e.g., gemma:2b)
- Increase system memory or virtual memory
- Close other memory-intensive programs

### View Logs
```bash
# View real-time logs
show-logs.bat

# View specific service logs
docker logs personalization-webui
docker logs personalization-ollama
```

## 💡 Usage Tips

1. **Preference Settings**: Save commonly used prompt templates in preference.md
2. **Model Switching**: Switch between different models in the top-left corner of the interface
3. **Conversation Export**: Support exporting conversations in Markdown format
4. **Batch Processing**: Upload documents for batch analysis

## 🔄 Update and Maintenance

### Update Service
```bash
docker-compose pull
restart-service.bat
```

### Backup Data
Docker volume locations:
- Web UI data: `webui-data`
- Ollama models: `ollama-data`

### Uninstall
1. Run `cleanup.bat`
2. Delete deployment folder
3. Uninstall Docker Desktop (optional)

## 📞 Technical Support

If you encounter issues:
1. Check the troubleshooting section of this document
2. Run `show-logs.bat` to view detailed logs
3. Check Docker and system resource usage

---

**Version**: v1.0  
**Last Updated**: 2025-08-31  
**Compatibility**: Windows 10/11, Docker Desktop
