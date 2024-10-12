from fastapi import FastAPI
from fastapi.responses import RedirectResponse
from fastapi.middleware.cors import CORSMiddleware

import subprocess as sp
import json
import logging
import uvicorn

app = FastAPI()

### Allows the application to be accessible from Web when it has been dockerized ###
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True,
)

def execute_command(cmd: str):
    proc = sp.Popen(cmd, shell=True, stderr=sp.PIPE, stdout=sp.PIPE)
    stdout, stderr = proc.communicate()
    return stdout, stderr

@app.get('/', include_in_schema=False)
async def docs_redirect():
    return RedirectResponse(url="/docs")

@app.get("/load")
async def get_compute_load():
    #### Get System Average Loads ####
    uptime_cmd = 'uptime' # Get the Average System Loads using the uptime command
    load_averages, uptime_cmd_error = execute_command(cmd=uptime_cmd)
    if uptime_cmd_error:
        logging.error(f'Error occured while exeucting uptime command to get load averages: {uptime_cmd_error}')

    #### Get Disk Capacity ####
    df_cmd = "df -H"
    df_usage, df_cmd_error = execute_command(cmd=df_cmd)

    if uptime_cmd_error:
        logging.error(f'Error occured while exeucting df command to get disk usage: {df_cmd_error}')
    
    return {
        "load averages" : load_averages.decode(),
        "disk capacity" : df_usage.decode()
    }

@app.get("/return_value")
async def return_value():
    try:
        with open('tech_assess.json', 'r') as file:
            data = json.load(file)
    except FileNotFoundError as e:
        logging.error("The tech_assess.json was not found on root module file path")
        return {"message": "The tech_assess.json was not found on local file path"}

    return {"return_value" : data['tech']['return_value']}

@app.post("/return_value/")
async def update_return_value(value: int):
    try:
        with open('tech_assess.json', 'r') as file:
            data = json.load(file)
            data['tech']['return_value'] = value
        
        with open('tech_assess.json', 'w') as json_file:
            json.dump(data, json_file)
            
    except FileNotFoundError as e:
        logging.error("The tech_assess.json was not found on root module file path")
        return {"message": "The tech_assess.json was not found on local file path"}
    
    return {
        "message": "return_value updates successfully"
    }

if __name__ == "__main__":
    uvicorn.run("app:app", reload=True)