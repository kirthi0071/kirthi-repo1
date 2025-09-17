# Use Python 3.11 slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port 8080 (required by Cloud Run)
EXPOSE 8080

# Run the app with gunicorn for production
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
