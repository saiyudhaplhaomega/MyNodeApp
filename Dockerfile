FROM node
#FROM --platform=linux/arm64 node
#platform is not needed because docker will automatically detect the platform
LABEL app=my-node-app
WORKDIR /app
#RUN mkdir /app, not needed because of WORKDIR
#RUN cd /app, not needed because of WORKDIR
COPY package*.json ./
#COPY package.json /app/package.json, not needed because of WORKDIR
#makes faster builds by only copying package.json and package-lock.json
#and then running npm install, this way if only the app code changes
#RUN cd /app && npm install,now because of WORKDIR i dont need to cd into /app
RUN npm install
#CMD [ "node", "/app/bin/www" ]
#COPY . /app, no need because of WORKDIR
#COPY . . will copy everything from the current directory to /app 
COPY . .
#CMD ls *
#have the shell like this allowing to run the app with `docker run -it my-node-app`
# and quite easily
EXPOSE 3000 
CMD node ./bin/www