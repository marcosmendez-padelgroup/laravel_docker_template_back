# 🚀 Laravel + Docker + WSL2 Starter

Modern development environment for Laravel using **Docker Compose** and **WSL2**.  
Automated with a `Makefile` to simplify common tasks (build, start, stop...).

---

## ✅ Prerequisites

### 🧱 System
- Windows 10/11 with [WSL2](https://learn.microsoft.com/windows/wsl/install) enabled
- [Ubuntu 22.04 LTS](https://apps.microsoft.com/store/detail/ubuntu-2204-lts/9PN20MSR04DW) installed from the Microsoft Store
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) with:
    - WSL integration enabled
    - Your Ubuntu distro selected under: `Settings → Resources → WSL Integration`

### 💻 Optional but recommended
- [PHPStorm](https://www.jetbrains.com/phpstorm/) with plugins:
    - WSL Integration
    - Docker
    - Laravel Idea (paid, optional)

---

## ⚙️ Getting Started

1. Clone this repository:

```bash
git clone https://github.com/marcosmendez-padelgroup/laravel_docker_template_back
cd laravel_docker_template_back 
```

2. Configure the port (if needed) in the Docker `.env` file:

```env
APP_PORT=8005
```

3. Initialize the full environment with one command:

```bash
make build
```

This will:
- Start Docker containers
- Install Composer dependencies
- Create `.env` and generate the app key
- Run database migrations
- Set correct file permissions

4. Access Laravel in your browser:

```
http://localhost:8005
```

---

## 🔧 Available Commands

| Command         | Description                                   |
|----------------|-----------------------------------------------|
| `make build`   | Initializes the full environment from scratch |
| `make start`   | Starts existing containers                    |
| `make stop`    | Stops the containers (without removing them)  |
| `make destroy` | Removes containers, images, and volumes       |
| `make console` | Access Laravel container via bash             |

---

## ✨ Credits

This environment is inspired by best practices in Laravel, Docker, and DevOps.  
Made with ❤️ .

