# Use Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY app.py /app

# Install dependencies
RUN pip install flask

# Expose the port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
