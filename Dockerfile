# syntax=docker/dockerfile:1
FROM python:3.7
# Create and set the work directory inside the image named 'app'
#This instructs Docker to use this path as the default location for all subsequent commands.
#By doing this, we do not have to type out full file paths but can use relative paths based
#on the working directory.
WORKDIR /app
# Execute a pip install command using the list 'requirements.txt'
# COPY command below does this- Select file and then put into /app
#Esentially copy requirments.txt and put into the app directroy and place there app/requirements
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
# Copy the app file into the image working directory
COPY . .
# State the listening port for the container.
# The app's code does not actually specify the port, so it would be useful to include here.
EXPOSE 5000
# Run 'python app.py' on container start-up. This is the main process.
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
