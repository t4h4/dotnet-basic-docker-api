FROM mcr.microsoft.com/dotnet/sdk:8.0 AS builder
WORKDIR /app
RUN dotnet new web -o /app
COPY *.csproj ./
RUN dotnet restore
COPY Program.cs ./
RUN dotnet publish -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
ENV ASPNETCORE_URLS="http://+:5000"
COPY --from=builder /app/publish .
ENTRYPOINT ["dotnet", "app.dll"]
EXPOSE 5000

HEALTHCHECK --interval=5s --timeout=2s --start-period=3s --retries=1 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:5000 || exit 1
