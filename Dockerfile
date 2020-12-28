FROM node:alpine as builder 
 # Build process separate and run process is separate 

WORKDIR '/app'

COPY package.json . 

RUN npm instal 

COPY . . 

RUN npm run build 

FROM nginx  
  # Here not mentioing as becasue it will consider as spearate process 

COPY --from=builder /app/build /usr/share/nginx/html  
            # copy from builder just above and adding usr/share path 
            # By default nginx will take the content by sever starts
