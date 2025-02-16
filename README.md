# 📦 Dockerfile Workflow

## 🚀 Quick Start

To build and run the .NET application using Docker, use the following commands:

```sh
docker build -t best-practice-dotnet-app:1.0.0 .
```
```sh
docker run -p 5000:5000 best-practice-dotnet-app:1.0.0
```

## 🛠️ Builder (SDK) Stage
- **Pull the .NET SDK image** from Microsoft Container Registry.
- Copy project files and restore dependencies using `dotnet restore`.
- Compile the code and **publish the application** using `dotnet publish`.

## 🚀 Main (Runtime) Image
- Pull a **lightweight runtime image**.
- Create a **working directory** for the application.
- Create a user and set the required permissions.
- Configure **environment variables** like `ASPNETCORE_URLS`.

## 🏃 Running the Application
- Copy the **compiled and published** application to the final image.
- Define the **entry point (ENTRYPOINT)** using `dotnet <app>.dll`.
- **Expose port 5000** and start the container.

---

