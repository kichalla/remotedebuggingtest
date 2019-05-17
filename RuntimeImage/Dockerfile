FROM mcr.microsoft.com/dotnet/core/aspnet:2.1.10

# Install the SSHD server
RUN apt-get update \ 
 && apt-get install -y --no-install-recommends \
    openssh-server \
    zip \
    unzip \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/sshd

# # Set password to 'Docker!'. Change as needed.  
# RUN echo "root:Docker!" | chpasswd

# Copy settings file. See elsewhere to find them. 
COPY sshd_config /etc/ssh/sshd_config
COPY authorized_keys  root/.ssh/authorized_keys

# Install Visual Studio Remote Debugger
RUN curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l ~/vsdbg  

EXPOSE 2222