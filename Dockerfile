##Image
FROM python:3.11

#Workdir
WORKDIR /app

USER root

# Create the mnt directory for volume mounting
RUN mkdir -p /app/mnt

# Copy requirements first for better caching
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt



# Copy other files (excluding mnt since it will be mounted)
COPY Dockerfile /app/

#Expose Port
EXPOSE 8888

#Run
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]