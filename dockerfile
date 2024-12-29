# Use an official Python runtime as the base image
#argument is python and then the run time version, this cmd tells docker what base img to use

FROM python:3.12-rc-bookworm        


# Set the working directory in the container to /app driectory
#default directory for flask app
# INSTRUCTION ARGUMENT
WORKDIR /app

# Copy the current directory contents into the container at /app
#2 ARGS  - route dir, app folder (folder within the container where we wanna copy our project files)
COPY . /app

# Install the required packages
#--no-cache-dir flag tells pip not to store the downloaded packages in the cache directory
#and the required docs are defined in therequirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Set the environment variable for Flask
#sets the flask app env variable to app.py (which is the name of the flask application)
ENV FLASK_APP=app.py

# Run the command to start the Flask application (default cmd)
CMD ["flask", "run", "--host=0.0.0.0"]
