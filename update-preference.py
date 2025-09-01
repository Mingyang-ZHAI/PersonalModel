#!/usr/bin/env python3
"""
Preference Management Script for Personalized LLM Assistant

This script helps you manage your AI assistant preferences by:
1. Reading the current preference.md file
2. Allowing you to edit it
3. Restarting the service to apply changes
"""

import os
import subprocess
import sys
import tempfile
import time

PREFERENCE_FILE = "preference.md"
DOCKER_COMPOSE_FILE = "docker-compose.yml"

def read_preference():
    """Read current preference file"""
    try:
        with open(PREFERENCE_FILE, 'r', encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        print(f"❌ {PREFERENCE_FILE} not found!")
        return None

def write_preference(content):
    """Write content to preference file"""
    try:
        with open(PREFERENCE_FILE, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"✅ {PREFERENCE_FILE} updated successfully!")
        return True
    except Exception as e:
        print(f"❌ Error writing {PREFERENCE_FILE}: {e}")
        return False

def edit_preference(content):
    """Open preference file in default editor"""
    # Create a temporary file with current content
    with tempfile.NamedTemporaryFile(mode='w', suffix='.md', delete=False, encoding='utf-8') as f:
        f.write(content)
        temp_file = f.name
    
    try:
        # Try to open with default editor
        if sys.platform.startswith('win'):
            os.startfile(temp_file)
        elif sys.platform.startswith('darwin'):  # macOS
            subprocess.run(['open', temp_file])
        else:  # Linux
            subprocess.run(['xdg-open', temp_file])
        
        print(f"📝 Opened {PREFERENCE_FILE} in your default editor.")
        print("💡 Make your changes and save the file.")
        input("Press Enter when you're done editing...")
        
        # Read the edited content
        with open(temp_file, 'r', encoding='utf-8') as f:
            new_content = f.read()
        
        return new_content
    
    finally:
        # Clean up temporary file
        try:
            os.unlink(temp_file)
        except:
            pass

def restart_service():
    """Restart the Docker service"""
    print("🔄 Restarting service to apply changes...")
    try:
        # Stop the service
        subprocess.run(['docker-compose', 'down'], check=True)
        print("✅ Service stopped")
        
        # Start the service
        subprocess.run(['docker-compose', 'up', '-d'], check=True)
        print("✅ Service started")
        
        # Wait a moment for services to be ready
        print("⏳ Waiting for services to be ready...")
        time.sleep(10)
        
        print("🎉 Service restarted successfully!")
        print("🌐 You can now access your assistant at: http://localhost:8080")
        
    except subprocess.CalledProcessError as e:
        print(f"❌ Error restarting service: {e}")
        return False
    except FileNotFoundError:
        print("❌ docker-compose not found. Please ensure Docker Desktop is installed and running.")
        return False

def show_current_preference():
    """Display current preference content"""
    content = read_preference()
    if content:
        print("📋 Current preference content:")
        print("=" * 50)
        print(content)
        print("=" * 50)
    return content

def main():
    print("🤖 Personalized LLM Assistant - Preference Manager")
    print("=" * 60)
    
    # Check if preference file exists
    if not os.path.exists(PREFERENCE_FILE):
        print(f"❌ {PREFERENCE_FILE} not found!")
        print("💡 Creating a new preference file...")
        
        # Create a basic template
        template = """# 🤖 AI Assistant Preferences

## 🎯 General Guidelines

You are a helpful, intelligent AI assistant. Please follow these guidelines:

1. **Communication Style**: Be clear, concise, and professional
2. **Response Format**: Use markdown formatting for better readability
3. **Accuracy**: Always strive for accuracy and cite sources when making claims
4. **Helpfulness**: Provide practical, actionable advice
5. **Ethics**: Maintain ethical standards and avoid harmful content

## 📚 Your Specific Preferences

Add your specific preferences here, such as:
- Writing style preferences
- Technical requirements
- Domain-specific guidelines
- Language preferences
- Any other custom instructions

---
*Customize this template to match your specific needs and preferences.*"""
        
        if write_preference(template):
            print(f"✅ Created {PREFERENCE_FILE} with template")
        else:
            return
    
    while True:
        print("\n📋 Available actions:")
        print("1. View current preferences")
        print("2. Edit preferences")
        print("3. Restart service (apply changes)")
        print("4. View and edit preferences")
        print("5. Exit")
        
        choice = input("\n🎯 Choose an action (1-5): ").strip()
        
        if choice == '1':
            show_current_preference()
        
        elif choice == '2':
            content = read_preference()
            if content:
                new_content = edit_preference(content)
                if new_content != content:
                    if write_preference(new_content):
                        print("✅ Preferences updated!")
                    else:
                        print("❌ Failed to update preferences")
                else:
                    print("ℹ️ No changes detected")
        
        elif choice == '3':
            if restart_service():
                print("✅ Service restarted successfully!")
            else:
                print("❌ Failed to restart service")
        
        elif choice == '4':
            content = show_current_preference()
            if content:
                print("\n💡 Would you like to edit the preferences? (y/n): ", end='')
                if input().lower().startswith('y'):
                    new_content = edit_preference(content)
                    if new_content != content:
                        if write_preference(new_content):
                            print("✅ Preferences updated!")
                            if input("🔄 Restart service to apply changes? (y/n): ").lower().startswith('y'):
                                restart_service()
                        else:
                            print("❌ Failed to update preferences")
                    else:
                        print("ℹ️ No changes detected")
        
        elif choice == '5':
            print("👋 Goodbye!")
            break
        
        else:
            print("❌ Invalid choice. Please select 1-5.")

if __name__ == "__main__":
    main()
