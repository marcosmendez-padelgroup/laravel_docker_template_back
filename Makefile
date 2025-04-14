APP_CONTAINER=laravel-app
DB_CONTAINER=laravel-mysql
APP_PORT=$(shell grep APP_PORT .env | cut -d '=' -f2)

build:
	docker-compose down -v --remove-orphans
	docker-compose build
	docker-compose up -d
	@echo "⏳ Esperando a que MySQL esté listo..."
	sleep 10
	docker exec $(APP_CONTAINER) composer install
	docker exec $(APP_CONTAINER) cp .env.example .env || true
	docker exec $(APP_CONTAINER) php artisan key:generate
	docker exec $(APP_CONTAINER) php artisan config:clear
	docker exec $(APP_CONTAINER) php artisan config:cache
	docker exec $(APP_CONTAINER) php artisan migrate --force
	docker exec $(APP_CONTAINER) chown -R www-data:www-data storage bootstrap/cache
	docker exec $(APP_CONTAINER) chmod -R 775 storage bootstrap/cache
	@echo "✅ Proyecto inicializado en http://localhost:$(APP_PORT)"


start:
	docker-compose up -d
	@echo "🚀 Proyecto levantado en http://localhost:$(APP_PORT)"


stop:
	docker-compose stop
	@echo "🛑 Contenedores detenidos"

destroy:
	docker-compose down -v --rmi all --remove-orphans
	@echo "💥 Entorno eliminado por completo"


console:
	docker exec -it $(APP_CONTAINER) bash
