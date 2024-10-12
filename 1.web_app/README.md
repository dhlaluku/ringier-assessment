# Code Challenge
 A web API with endpoints that display the following information:
 * Endpoint and GET method returning: The average load of the server as well as the
available disk space on the current file system.
* Endpoint with GET method returning the value of the key called “return_value” within
the provided file named tech_assess.json
* Bonus: Endpoint with POST method, overwriting the value of the key called
“return_value” inside the file called tech_assess.json. This would result in the above
GET endpoint returning the value written with this method

The app is developed as a small web application that uses Python and the [fastapi](https://fastapi.tiangolo.com/) framework.

## Running the Application
It can be run purely with python using the system wide interpreter or within a virtualenv. For this exercise, we will run it using the system wide interpreter as follow. 

Install the requirements on your system
```bash
pip3 install requirements.txt
```
Run the application by running this command
```bash
python3 app.py
```
You should see an output to the one similar below.
```
INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
INFO:     Started reloader process [24282] using StatReload
INFO:     Started server process [24288]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```
You can navigate to `swagger` page by clicking on the provided link or typing it onto your favourite browser.


