from flask import Flask, request, jsonify
from langchain_groq import ChatGroq
from dotenv import load_dotenv
from langchain_core.messages import HumanMessage, SystemMessage
import firebase_admin
from firebase_admin import credentials, db
import os
from youtube_transcript_api import YouTubeTranscriptApi

load_dotenv()

# Initialize Firebase Admin SDK
cred = credentials.Certificate("new_credentials.json")
firebase_admin.initialize_app(cred, {
    "databaseURL": "https://multilingual-chat-app-54d26-default-rtdb.asia-southeast1.firebasedatabase.app/"
})

# Reference to the chat collection
ref = db.reference("/chats")

# Initialize LLM
llm = ChatGroq(
    model="llama-3.1-8b-instant",
    temperature=0,
    max_tokens=None,
    timeout=None,
    max_retries=2,
)

app = Flask(__name__)

@app.route("/chat", methods=["POST"])
def chat():
    data = request.get_json()
    user_input = data.get("message")
    if not user_input:
        return jsonify({"error": "Message is required"}), 400
    
    # Load previous chat history
    chat_history = []
    system_message = SystemMessage("Provide a clear, concise, and language-consistent response that is suitable for text-to-speech applications. Ensure that the response is generated in the same language in which the question is asked.")
    chat_history.append(system_message)
    
    previous_chats = ref.get()
    if previous_chats:
        for msg in previous_chats.values():
            chat_history.append(HumanMessage(msg["user"]))
            chat_history.append(HumanMessage(msg["ai"]))
    
    # Add new user input to history
    human_message = HumanMessage(user_input)
    chat_history.append(human_message)
    
    # Get AI response
    response = llm.invoke(chat_history)
    chat_history.append(response)
    
    # Save conversation to Firebase
    new_chat = ref.push()
    new_chat.set({
        "user": user_input,
        "ai": response.content
    })
    
    return jsonify({"response": response.content})

@app.route("/random", methods=["GET"])
def random():
    print("Random")
    return jsonify({"message": "Random", "status": 200})

@app.route("/get_video_transcript/<videoid>", methods=["GET"])
def get_video_transcript(videoid):
    print("get_video_transcript")
    try:
        transcript_text = YouTubeTranscriptApi.get_transcript(videoid)
        transcript = " ".join([i["text"] for i in transcript_text])
        return jsonify({"transcript": transcript, "status": 200})
    except Exception as e:
        return jsonify({"error": str(e), "status": 500})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

# command to run the program so that it must be accesssible to everyone
# flask run --host=0.0.0.0 --port=5000
