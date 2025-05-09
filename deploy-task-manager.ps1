# Перевірка Docker
Write-Host "🔍 Перевірка Docker..."
try {
    docker version > $null
    Write-Host "✅ Docker працює."
} catch {
    Write-Host "❌ Docker не працює. Запусти Docker Desktop і спробуй ще раз."
    exit 1
}

# Перевірка Minikube
Write-Host "🚀 Запуск або перевірка Minikube..."
$minikubeStatus = minikube status 2>&1

if ($minikubeStatus -like "*host: Running*") {
    Write-Host "✅ Minikube вже запущений."
} else {
    Write-Host "📦 Створення нового кластера Minikube..."
    minikube delete
    minikube start --driver=docker

    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Не вдалося запустити Minikube. Перевір Docker."
        exit 1
    }
}

# Встановлення контексту
kubectl config use-context minikube

# Деплой MongoDB
Write-Host "📄 Деплой mongo-deployment.yml..."
kubectl apply -f mongo-deployment.yml

# Деплой Task Manager
Write-Host "📄 Деплой task-manager-deployment.yml..."
kubectl apply -f task-manager-deployment.yml

Write-Host "✅ Деплой завершено успішно!"
