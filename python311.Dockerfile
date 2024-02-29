# Utilisation de l'image de base Python
FROM python:3.11-slim

ARG SCRIPT_PATH

# Copier le fichier Python dans le répertoire de travail du conteneur
COPY  ${SCRIPT_PATH} /app/script.py

# Définir le répertoire de travail
WORKDIR /app

# Exécuter le script Python lorsque le conteneur démarre
CMD ["python", "script.py"]
