# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Copy the entry point script into the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entry point script executable
RUN chmod +x /app/entrypoint.sh

# Set the entry point to the script
ENTRYPOINT ["/app/entrypoint.sh"]

RUN python -m pip install --upgrade pip setuptools wheel

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 80
EXPOSE 80

# Run the application
CMD ["python", "desafio.py"]

