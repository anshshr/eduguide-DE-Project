from flask import Flask, request, jsonify
from langchain_groq import ChatGroq
from dotenv import load_dotenv
from langchain_core.messages import HumanMessage, SystemMessage
import firebase_admin
from firebase_admin import credentials, db
import os
from youtube_transcript_api import YouTubeTranscriptApi
from plant.encoder import encode_plantuml


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

# # 🧠 AGENT: Career Path Navigator
# @app.route("/career_path_advice", methods=["POST"])
# def career_path_advice():
#     data = request.get_json()
#     topic = data.get("goal")
#     if not topic:
#         return jsonify({"error": "Goal is required"}), 400

#     prompt = f"""
#     You are a career path planning assistant. A user wants to become {topic}.
#     Provide a step-by-step roadmap including:
#     - Learning courses or certifications
#     - Suggested projects or portfolio ideas
#     - Resume improvement tips
#     - Job titles to apply for in 3, 6, and 12 months
#     """

#     response = llm.invoke([HumanMessage(prompt)])
#     return jsonify({"career_path_plan": response.content})

# # 🧑‍🏫 AGENT: Mentorship Matchmaking
# @app.route("/mentor_match", methods=["POST"])
# def mentor_match():
#     data = request.get_json()
#     user_topic = data.get("topic")
#     if not user_topic:
#         return jsonify({"error": "Topic is required"}), 400

#     prompt = f"""
#     You are an intelligent mentor-matching assistant.
#     A user is looking for mentorship on: "{user_topic}"
#     Based on this, return:
#     - Tags required in mentor profiles
#     - Type of mentor (HR, Software Engineer, Interview Coach, etc.)
#     - Ideal session goals
#     - Summary to send post-session
#     """

#     response = llm.invoke([HumanMessage(prompt)])
#     return jsonify({"mentor_match_suggestion": response.content})

# to generate the fow chart of the user specific needs
@app.route("/generate_diagram", methods=["POST"])
def generate_diagram():
    data = request.get_json()
    topic = data.get("topic")

    if not topic:
        return jsonify({"error": "Topic is required"}), 400

    # Generate PlantUML flowchart code using LLM
    prompt = f"Generate a simple PlantUML flowchart that guides a user through a career plan for: {topic}. Use start, action, decision, and stop blocks."
    response = llm.invoke([HumanMessage(prompt)])
    plantuml_code = response.content.strip()

    try:
        # Encode for PlantUML server
        encoded = encode_plantuml(plantuml_code)
        img_url = f"https://www.plantuml.com/plantuml/svg/{encoded}"
        return jsonify({"image_url": img_url, "plantuml_code": plantuml_code})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

# command to run the program so that it must be accesssible to everyone
# flask run --host=0.0.0.0 --port=5000
