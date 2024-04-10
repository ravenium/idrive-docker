FROM ubuntu:latest
RUN apt update && apt install -y wget vim python3 
RUN mkdir -p /opt/IDriveForLinux/bin
RUN mkdir /backups
WORKDIR /opt/IDriveForLinux/bin
RUN wget https://www.idrivedownloads.com/downloads/linux/download-for-linux/linux-bin/idriveforlinux.bin
RUN echo "PATH=/opt/IDriveForLinux/bin:$PATH" >> ~/.bashrc
RUN echo "export LD_LIBRARY_PATH=/opt/IDriveForLinux/bin/Idrivelib/dependencies/python/lib:$LD_LIBRARY_PATH" >> ~/.bashrc
RUN chmod +x idriveforlinux.bin
COPY entrypoint.sh /opt/IDriveForLinux/bin/entrypoint.sh
RUN chmod +x /opt/IDriveForLinux/bin/entrypoint.sh
ENTRYPOINT ["/opt/IDriveForLinux/bin/entrypoint.sh"]
