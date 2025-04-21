# Use official Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy the requirements first to leverage Docker cache for dependencies
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . /app

# Expose Flask default port
EXPOSE 5000

# Run the Flask app
CMD ["python", "web_chatbot.py"]
