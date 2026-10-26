# start with a lightweight python image
# this gived our container a python runtime
FROM python:3.14-slim

#set the working directory inside the container
WORKDIR /app

#cody the dependencies list 
COPY requirements.txt .

#avoid retaining pip download cache in the image
RUN pip install --no-cache-dir -r requirements.txt

#copy the apllication code and saves model into /app
COPY . .

#document the port used by fastapi application
EXPOSE 8000

#start the api server
# 0.0.0.0 allows connection through the container's network interface
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000"]