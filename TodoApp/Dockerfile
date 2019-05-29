FROM aspnetcore21-ssh AS base
WORKDIR /app
ENV PORT 5000
EXPOSE $PORT
ENV ASPNETCORE_URLS=http://*:$PORT/

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src/TodoApp
COPY TodoApp.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Debug -o /app

FROM base AS final
WORKDIR /app
COPY StartSSHAndApp.sh .
RUN chmod +x ./StartSSHAndApp.sh
COPY --from=build /app .
#ENTRYPOINT ["dotnet", "TodoApp.dll"]

CMD /app/StartSSHAndApp.sh

# If you wish to only have SSH running and start your service when you start debugging
# then use just the SSH server, you don't need the script
#CMD ["/usr/sbin/sshd", "-D"]