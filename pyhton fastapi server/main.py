from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get('/')
async def root():
    print('Hello, World')
    return {'message': 'Hello, World','status': 200}

@app.get('/random')
async def random():
    print('Random')
    return {'message': 'Random','status': 200}

@app.get('/get_video_transcript/{videoid}')
async def get_video_transcript(videoid: str):
    print('get_video_transcript')
    from youtube_transcript_api import YouTubeTranscriptApi
    transcript_text = YouTubeTranscriptApi.get_transcript(videoid)
    transcript = ''
    for i in transcript_text:
        transcript += i['text'] + ' '
        
    return {'transcript': transcript,'status': 200}
    



# todo : for runni the server use ->  python -m uvicorn main:app --host 0.0.0.0 --port 8000  
