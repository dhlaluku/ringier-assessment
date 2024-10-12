FROM python:3.12-slim

WORKDIR /app
RUN pip3 install --upgrade pip
RUN pip3 install uvicorn fastapi
COPY app.py /app/
EXPOSE 80
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]