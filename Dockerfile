# Use an official Python image as a base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your backend code and models
# 💡 Your models and data need to be in the correct relative path
COPY . .

# Expose the port your FastAPI app will run on
EXPOSE 8080

# Start the FastAPI server using Uvicorn
CMD ["uvicorn", "app.backend:app", "--host", "0.0.0.0", "--port", "8080"]