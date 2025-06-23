FROM python:3.10-slim

# System dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy all files
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Set Streamlit to run on port 10000
ENV PORT=10000

# Streamlit entry point
CMD ["streamlit", "run", "main.py", "--server.port=10000", "--server.address=0.0.0.0"]
