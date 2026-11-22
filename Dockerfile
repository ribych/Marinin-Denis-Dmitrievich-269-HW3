FROM python:3.11-slim
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV GREETING="Hello from Docker"
EXPOSE 8000
CMD ["python", "app/app.py"]
