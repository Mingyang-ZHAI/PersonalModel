import requests
import json

OLLAMA_API = "http://localhost:11434/api/generate"
MODEL_NAME = "qwen3:4b"

def chat_with_pref(user_message, preference_file="preference.md"):
    # Read preference
    with open(preference_file, "r", encoding="utf-8") as f:
        preference = f.read()
    print(preference)

    prompt = f"You are a personalized assistant, following these preferences:\n{preference}\n\nUser: {user_message}\nAssistant: "

    try:
        print("Sending request to Ollama...")
        response = requests.post(
            OLLAMA_API, 
            json={"model": MODEL_NAME, "prompt": prompt, "stream": False},
            timeout=60
        )
        print(f"Received response, status code: {response.status_code}")
        
        response.raise_for_status()
        data = response.json()
        
        # Ollama generate API returns content in data['response']
        reply = data["response"]
        return reply
        
    except requests.exceptions.Timeout:
        return "Error: Request timeout, please check if Ollama is running properly"
    except requests.exceptions.ConnectionError:
        return "Error: Cannot connect to Ollama, please ensure Ollama is running on localhost:11434"
    except json.JSONDecodeError as e:
        print(f"JSON parsing error: {e}")
        print(f"Response content: {response.text[:200]}...")
        return "Error: Incorrect response format"
    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == "__main__":
    print("Start chatting (type 'exit' to quit)")
    while True:
        msg = input("You: ")
        if msg.lower() in ("exit", "quit"):
            break
        reply = chat_with_pref(msg)
        print("Assistant:", reply)
